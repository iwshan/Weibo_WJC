//
//  DownLoad.m
//  TDownLoader
//
//  Created by TRALIN on 13-1-25.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "DownLoad.h"

@implementation DownLoad

@synthesize urlStr;

-(void)dealloc{
    self.urlStr = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableData alloc]init];
    }
    return self;
}

-(void)setfinish:(FinishDown)ablock{
    [finishDown release];
    finishDown = [ablock copy];
}

-(void)download{
    
    NSURL * url = [NSURL URLWithString:self.urlStr];
    
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:req delegate:self];
    
}

-(UIImage *)setDefautImg:(UIImage *)Img AndFinishDO:(FinishDown)ablock{
    [finishDown release];
    finishDown = [ablock copy];
    [self download];
    return Img;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    _fileSize = response.expectedContentLength;
//    NSLog(@"%f",_fileSize);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //    NSLog(@"%s",__func__);
    [_data appendData:data];
//    int a = [_data length];
//    NSLog(@"%s%0.f%%",__func__,a/_fileSize*100);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    UIImage * Img = [UIImage imageWithData:_data];
    if (finishDown) {
        finishDown(Img);
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error.description);
    NSLog(@"%@",self.urlStr);
}

@end
