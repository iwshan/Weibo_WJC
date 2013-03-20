//
//  SinaWeiboRequest.m
//  sinaweibo_ios_sdk
//  Based on OAuth 2.0
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  Copyright 2011 Sina. All rights reserved.
//

#import "SinaWeiboRequest.h"
#import "SinaWeiboConstants.h"
#import "JSONKit.h"
#import "SinaWeibo.h"
#import "RequestUrlModel.h"
#import "RequestUrlToModel.h"
#import "NSObject+setpropertyValueWithDatasource.h"
#import "Microblog.h"

#define kSinaWeiboRequestTimeOutInterval   180.0
#define kSinaWeiboRequestStringBoundary    @"293iosfksdfkiowjksdf31jsiuwq003s02dsaffafass3qw"

@interface NSString (SinaWeiboEncode)
- (NSString *)URLEncodedString;
@end

@implementation NSString (SinaWeiboEncode)

- (NSString *)URLEncodedStringWithCFStringEncoding:(CFStringEncoding)encoding
{
    return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[self mutableCopy] autorelease], NULL, CFSTR("￼=,!$&'()*+;@?\n\"<>#\t :/"), encoding) autorelease];
}

- (NSString *)URLEncodedString
{
	return [self URLEncodedStringWithCFStringEncoding:kCFStringEncodingUTF8];
}

@end

@interface SinaWeibo (SinaWeiboRequest)
- (void)requestDidFinish:(SinaWeiboRequest *)request;
- (void)requestDidFailWithInvalidToken:(NSError *)error;
@end

@interface SinaWeiboRequest (Private)

- (void)appendUTF8Body:(NSMutableData *)body dataString:(NSString *)dataString;
- (NSMutableData *)postBodyHasRawData:(BOOL*)hasRawData;

- (void)handleResponseData:(NSData *)data;
- (id)parseJSONData:(NSData *)data error:(NSError **)error;

- (id)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo;
- (void)failedWithError:(NSError *)error;

@end


@implementation SinaWeiboRequest

@synthesize sinaweibo;
@synthesize url;
@synthesize httpMethod;
@synthesize params;
@synthesize delegate;

#pragma mark - SinaWeiboRequest Block
-(void)setResponseBlock:(SWRequestBlock)block
{
    [responseBlock release];
    responseBlock = [block copy];
}
-(void)setFailBlock:(SWRequestBlock)block
{
    [failBlock release];
    failBlock = [block copy];
}
-(void)setRawDataBlock:(SWRequestBlock)block
{
    [rawDataBlock release];
    rawDataBlock = [block copy];
}
-(void)setResultBlock:(SWRequestBlock)block
{
    [resultBlock release];
    resultBlock = [block copy];
}
-(void)setFinishBlock:(SWFinishBlock)block
{
    [finishBlock release];
    finishBlock = [block copy];
}

#pragma mark - SinaWeiboRequest Life Circle

- (void)dealloc
{
    sinaweibo = nil;
    
    [url release], url = nil;
    [httpMethod release], httpMethod = nil;
    [params release], params = nil;
    
    [responseData release];
	responseData = nil;
    
    [connection cancel];
    [connection release], connection = nil;
    
    [super dealloc];
}

#pragma mark - SinaWeiboRequest Private Methods

- (void)appendUTF8Body:(NSMutableData *)body dataString:(NSString *)dataString
{
    [body appendData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSMutableData *)postBodyHasRawData:(BOOL*)hasRawData
{
    NSString *bodyPrefixString = [NSString stringWithFormat:@"--%@\r\n", kSinaWeiboRequestStringBoundary];
    NSString *bodySuffixString = [NSString stringWithFormat:@"\r\n--%@--\r\n", kSinaWeiboRequestStringBoundary];
    
    NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionary];
    
    NSMutableData *body = [NSMutableData data];
    [self appendUTF8Body:body dataString:bodyPrefixString];
    
    for (id key in [params keyEnumerator]) 
    {
        if (([[params valueForKey:key] isKindOfClass:[UIImage class]]) || ([[params valueForKey:key] isKindOfClass:[NSData class]]))
        {
            [dataDictionary setObject:[params valueForKey:key] forKey:key];
            continue;
        }
        
        [self appendUTF8Body:body dataString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n", key, [params valueForKey:key]]];
        [self appendUTF8Body:body dataString:bodyPrefixString];
    }
    
    if ([dataDictionary count] > 0) 
    {
        *hasRawData = YES;
        for (id key in dataDictionary) 
        {
            NSObject *dataParam = [dataDictionary valueForKey:key];
            
            if ([dataParam isKindOfClass:[UIImage class]]) 
            {
                NSData* imageData = UIImagePNGRepresentation((UIImage *)dataParam);
                [self appendUTF8Body:body dataString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"file\"\r\n", key]];
                [self appendUTF8Body:body dataString:[NSString stringWithString:@"Content-Type: image/png\r\nContent-Transfer-Encoding: binary\r\n\r\n"]];
                [body appendData:imageData];
            } 
            else if ([dataParam isKindOfClass:[NSData class]]) 
            {   
                [self appendUTF8Body:body dataString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"file\"\r\n", key]];
                [self appendUTF8Body:body dataString:[NSString stringWithString:@"Content-Type: content/unknown\r\nContent-Transfer-Encoding: binary\r\n\r\n"]];
                [body appendData:(NSData*)dataParam];
            }
            [self appendUTF8Body:body dataString:bodySuffixString];
        }
    }
    
    return body;
}

- (void)handleResponseData:(NSData *)data 
{
    if ([delegate respondsToSelector:@selector(request:didReceiveRawData:)])
    {
        [delegate request:self didReceiveRawData:data];
    }
	
	NSError *error = nil;
	id result = [self parseJSONData:data error:&error];
	
	if (error) 
	{
		[self failedWithError:error];
	} 
	else 
	{
        NSInteger error_code = 0;
        if([result isKindOfClass:[NSDictionary class]])
        {
            [[result objectForKey:@"error_code"] intValue];
        }
        
        if (error_code != 0)
        {
            NSString *error_description = [result objectForKey:@"error"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                      result, @"error",
                                      error_description, NSLocalizedDescriptionKey, nil];
            NSError *error = [NSError errorWithDomain:kSinaWeiboSDKErrorDomain
                                                 code:[[result objectForKey:@"error_code"] intValue]
                                             userInfo:userInfo];
            
            if (error_code == 21314     //Token已经被使用
                || error_code == 21315  //Token已经过期
                || error_code == 21316  //Token不合法
                || error_code == 21317  //Token不合法
                || error_code == 21327  //token过期
                || error_code == 21332) //access_token 无效
            {
                [sinaweibo requestDidFailWithInvalidToken:error];
            }
            else
            {
                [self failedWithError:error];
            }
        }
        else
        {
            if ([delegate respondsToSelector:@selector(request:didFinishLoadingWithResult:)])
            {
                [delegate request:self didFinishLoadingWithResult:(result == nil ? data : result)];
            }
            NSMutableArray * mArr = [self parseModelWithDataSource:(result == nil ? data : result) withSinaWeiboRequest:self];
            if (finishBlock) {
                finishBlock(mArr);
            }
        }
	}
}

-(NSMutableArray *)parseModelWithDataSource:(NSData *)data withSinaWeiboRequest:(SinaWeiboRequest*)sinaWeiboRequest {
    RequestUrlModel * requesturlMOdel = (RequestUrlModel*)[[RequestUrlToModel shareRequestUrlToModel].dicList objectForKey:sinaWeiboRequest.url];
    Class classModel = NSClassFromString(requesturlMOdel.modelName);
    NSDictionary * dicData = (NSDictionary *)data;
    NSArray * arrData = [dicData objectForKey:(requesturlMOdel.parseNode)];
    NSMutableArray * mArrData = [[[NSMutableArray alloc]init]autorelease];
    for (NSDictionary * dicModel in arrData) {
        id instanceModel = [[[classModel alloc]init]autorelease];
        [instanceModel isKindOfClass:[Microblog class]];
        [mArrData addObject:[instanceModel setPropertyValueWithDataSource:(NSDictionary *)dicModel]];
    }
    if ([[[[classModel alloc]init]autorelease] isKindOfClass:[Microblog class]]) {
        mArrData = [self setMicroblogType:mArrData];
    }
    return mArrData;
}

-(NSMutableArray*)setMicroblogType:(NSMutableArray *)arrData{
    for (NSObject * obj in arrData) {
        Microblog* firstModel = (Microblog *)obj;
        Microblog * secondModel = (Microblog *)firstModel.retweetedstatus;
        if (secondModel!=nil) {
            if (secondModel.thumbnailpic!=nil) {
                firstModel.type= ReImage_Cell;
            }else{
                firstModel.type = ReText_Cell;
            }
        }else{
            if (firstModel.thumbnailpic!=nil) {
                firstModel.type = TextImage_Cell;
            }else{
                firstModel.type = Text_Cell;
            }
        }
    }
    //B哥调试type时 留下的珍贵印记 做个纪念吧
//    for (NSObject * obj in arrData) {
//        Microblog* firstModel = (Microblog *)obj;
//        NSLog(@"%d",firstModel.type);
//    }
    return arrData;
}

- (id)parseJSONData:(NSData *)data error:(NSError **)error
{
    NSError *parseError = nil;
	id result =[data objectFromJSONDataWithParseOptions:JKParseOptionStrict error:&parseError];
	
	if (parseError && (error != nil))
    {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                  parseError, @"error",
                                  @"Data parse error", NSLocalizedDescriptionKey, nil];
        *error = [self errorWithCode:kSinaWeiboSDKErrorCodeParseError
                            userInfo:userInfo];
	}
	
	return result;
}

- (id)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo
{
    return [NSError errorWithDomain:kSinaWeiboSDKErrorDomain code:code userInfo:userInfo];
}

- (void)failedWithError:(NSError *)error 
{
	if ([delegate respondsToSelector:@selector(request:didFailWithError:)]) 
	{
		[delegate request:self didFailWithError:error];
	}
}

#pragma mark - SinaWeiboRequest Public Methods

+ (NSString *)getParamValueFromUrl:(NSString*)url paramName:(NSString *)paramName
{
    if (![paramName hasSuffix:@"="])
    {
        paramName = [NSString stringWithFormat:@"%@=", paramName];
    }
    
    NSString * str = nil;
    NSRange start = [url rangeOfString:paramName];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [url characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {        
            NSRange end = [[url substringFromIndex:start.location+start.length] rangeOfString:@"&"];
            NSUInteger offset = start.location+start.length;
            str = end.location == NSNotFound ?
            [url substringFromIndex:offset] : 
            [url substringWithRange:NSMakeRange(offset, end.location)];
            str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }    
    return str;
}

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params httpMethod:(NSString *)httpMethod
{
    NSURL* parsedURL = [NSURL URLWithString:baseURL];
    NSString* queryPrefix = parsedURL.query ? @"&" : @"?";
    
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [params keyEnumerator])
    {
        if (([[params objectForKey:key] isKindOfClass:[UIImage class]])
            ||([[params objectForKey:key] isKindOfClass:[NSData class]]))
        {
            if ([httpMethod isEqualToString:@"GET"])
            {
                NSLog(@"can not use GET to upload a file");
            }
            continue;
        }
        
        NSString* escaped_value = (NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                      NULL, /* allocator */
                                                                                      (CFStringRef)[params objectForKey:key],
                                                                                      NULL, /* charactersToLeaveUnescaped */
                                                                                      (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                      kCFStringEncodingUTF8);
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escaped_value]];
        [escaped_value release];
    }
    NSString* query = [pairs componentsJoinedByString:@"&"];
    
    return [NSString stringWithFormat:@"%@%@%@", baseURL, queryPrefix, query];
}

+ (SinaWeiboRequest *)requestWithURL:(NSString *)url 
                          httpMethod:(NSString *)httpMethod 
                              params:(NSDictionary *)params
                            delegate:(id<SinaWeiboRequestDelegate>)delegate
{
    SinaWeiboRequest *request = [[[SinaWeiboRequest alloc] init] autorelease];
    
    request.url = url;
    request.httpMethod = httpMethod;
    request.params = params;
    request.delegate = delegate;
    
    return request;
}

+ (SinaWeiboRequest *)requestWithAccessToken:(NSString *)accessToken
                                         url:(NSString *)url
                                  httpMethod:(NSString *)httpMethod 
                                      params:(NSDictionary *)params
                                    delegate:(id<SinaWeiboRequestDelegate>)delegate
{
    // add the access token field
    NSMutableDictionary *mutableParams = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParams setObject:accessToken forKey:@"access_token"];
    return [SinaWeiboRequest requestWithURL:url
                                 httpMethod:httpMethod
                                     params:mutableParams
                                   delegate:delegate];
}

- (void)connect
{
    NSString* urlString = [[self class] serializeURL:url params:params httpMethod:httpMethod];
    NSMutableURLRequest* request =
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                            cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                        timeoutInterval:kSinaWeiboRequestTimeOutInterval];
    
    [request setHTTPMethod:self.httpMethod];
    if ([self.httpMethod isEqualToString: @"POST"])
    {
        BOOL hasRawData = NO;
        [request setHTTPBody:[self postBodyHasRawData:&hasRawData]];
        
        if (hasRawData)
        {
            NSString* contentType = [NSString
                                     stringWithFormat:@"multipart/form-data; boundary=%@", kSinaWeiboRequestStringBoundary];
            [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
        }
    }
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)disconnect
{
    [responseData release];
	responseData = nil;
    
    [connection cancel];
    [connection release], connection = nil;
}

#pragma mark - NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	responseData = [[NSMutableData alloc] init];
	
	if ([delegate respondsToSelector:@selector(request:didReceiveResponse:)])
    {
		[delegate request:self didReceiveResponse:response];
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
				  willCacheResponse:(NSCachedURLResponse*)cachedResponse 
{
	return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection 
{
	[self handleResponseData:responseData];
    
	[responseData release];
	responseData = nil;
    
    [connection cancel];
	[connection release];
	connection = nil;
    
    [sinaweibo requestDidFinish:self];
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
{
	[self failedWithError:error];
	
	[responseData release];
	responseData = nil;
    
    [connection cancel];
	[connection release];
	connection = nil;
    
    [sinaweibo requestDidFinish:self];
}

@end
