//
//  NSString+Html.h
//  webcodeTst
//
//  Created by TRALIN on 13-3-10.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Html)

-(NSString *)FormatToHtml;

@end

@implementation NSString (Html)

-(NSString *)FormatToHtml{
    //html头
    NSString * htmlTop = @"<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><style>body{margin:0px;padding:0px;font-size:14px;}span{color:orange;}img{width:16px;vertical-align:top;}div{vertical-align:top;}</style><title>tstPage</title><body><div>";
    //html尾
    NSString * htmlEnd = @"</div></body></html>";
    
    self = [self RegularMatchHttpWith:self];
    self = [self RegularMatchNameWith:self];
    self = [self RegularMatchFaceImgWith:self];
    
    //最后加上html头尾，构成web code
    self = [NSString stringWithFormat:@"%@%@%@",htmlTop,self,htmlEnd];
    //返回处理后的字符串
    return self;
}

-(NSString *)RegularMatchFaceImgWith:(NSString *)aHtmlStr{
    //表情解析部分
    NSString * faceregx = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    NSDictionary * aDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotionImage" ofType:@"plist"]];
    NSError * error;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:faceregx options:0 error:&error];
    NSRange resultRange;
    NSArray * chunks = [regex matchesInString:aHtmlStr options:0 range:NSMakeRange(0, aHtmlStr.length)];
    if (regex != nil)
        for (int i = chunks.count - 1 ; i>=0 ; i--) {
            resultRange = ((NSTextCheckingResult *)[chunks objectAtIndex:i]).range;
            NSString * resultStr = [aHtmlStr substringWithRange:resultRange];
            if ([aDic valueForKey:resultStr]) {
                resultStr = [NSString stringWithFormat:@"<img src = '%@' />",[aDic valueForKey:resultStr]];
                aHtmlStr = [aHtmlStr stringByReplacingCharactersInRange:resultRange withString:resultStr];
            }
        }
    return aHtmlStr;
}

-(NSString *)RegularMatchNameWith:(NSString *)aHtmlStr{
    //@人名 正则表达匹配
    NSError * error;
    NSString * emregStr = @"@[^\\.^\\,^:^;^!^\\?^\\s^#^@^。^，^：^；^！^？^\\[]+";
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:emregStr options:0 error:&error];
    NSRange resultRange;
    NSArray * chunks = [regex matchesInString:aHtmlStr options:0 range:NSMakeRange(0, aHtmlStr.length)];
    
    if (regex != nil)for(int i = chunks.count - 1; i>=0 ; i--){
        resultRange = ((NSTextCheckingResult *)[chunks objectAtIndex:i]).range;
        NSString * resultStr = [aHtmlStr substringWithRange:resultRange];
        resultStr = [NSString stringWithFormat:@"<span>%@</span>",resultStr];
        aHtmlStr = [aHtmlStr stringByReplacingCharactersInRange:resultRange withString:resultStr];
    }

    return aHtmlStr;
}

-(NSString *)RegularMatchHttpWith:(NSString *)aHtmlStr{
    //http开头网址 正则匹配
    NSError * error;
    NSString * httpegStr = @"http+:[^\\s]*";
    NSRegularExpression * httpregex = [NSRegularExpression regularExpressionWithPattern:httpegStr options:0 error:&error];
    if (httpregex != nil) {
        NSTextCheckingResult * httpMach = [httpregex firstMatchInString:aHtmlStr options:0 range:NSMakeRange(0, aHtmlStr.length)];
        if (httpMach) {
            NSRange httpRange = httpMach.range;
            NSString * httpMachOut = [aHtmlStr substringWithRange:httpRange];
            httpMachOut = [NSString stringWithFormat:@"<a color='#fff' href='%@'>%@</a>",httpMachOut,httpMachOut];
            aHtmlStr = [aHtmlStr stringByReplacingCharactersInRange:httpRange withString:httpMachOut];
        }
    }
    return aHtmlStr;
}

@end