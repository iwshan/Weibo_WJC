//
//  NSObject+setpropertyValueWithDatasource.m
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "NSObject+setpropertyValueWithDatasource.h"
#import "RequestUrlModel.h"
#import "RequestUrlToModel.h"
#import "SinaWeiboRequest.h"
#import "NSObject+setpropertyValueWithDatasource.h"

@implementation NSObject (setpropertyValueWithDatasource)
/*
+(NSMutableArray *)parseModelWithDataSource:(NSData *)data withSinaWeiboRequest:(SinaWeiboRequest*)sinaWeiboRequest {
    RequestUrlModel * requesturlMOdel = (RequestUrlModel*)[[RequestUrlToModel shareRequestUrlToModel].dicList objectForKey:sinaWeiboRequest.url];

    Class classModel = NSClassFromString(requesturlMOdel.modelName);
    id instanceModel = [[classModel alloc]init];
    
    NSDictionary * dicData = (NSDictionary *)data;
    NSArray * arrData = [dicData objectForKey:requesturlMOdel.parseNode];
    NSMutableArray * mArrData = [[[NSMutableArray alloc]init]autorelease];
    for (NSDictionary * dicModel in arrData) {
        [mArrData addObject:[instanceModel setPropertyValueWithDataSource:(NSDictionary *)dicModel]];
    }
    
    return mArrData;
}*/

-(id)setPropertyValueWithDataSource:(NSDictionary *)dicData{
    NSArray * arrKey = [dicData allKeys];
    for (NSString * key in arrKey) {
        NSString * strKey = nil;
        strKey = [key stringByReplacingOccurrencesOfString:@"_" withString:@""];
        //拼接获取getXXXClass方法
        NSString * strGetMethodClass = [NSString stringWithFormat:@"%@%@%@",@"get",[strKey capitalizedString],@"Class"];
        SEL getMethodClass = NSSelectorFromString(strGetMethodClass);
        if ([self respondsToSelector:getMethodClass]) {
            Class classModel = [self performSelector:getMethodClass];
            id instanceModel = [[[classModel alloc]init]autorelease];
            
            NSString * strSetMethod = [NSString stringWithFormat:@"%@%@%@",@"set",[strKey capitalizedString],@":"];
            SEL setMethod = NSSelectorFromString(strSetMethod);
            
            [self performSelector:setMethod withObject:[instanceModel setPropertyValueWithDataSource:(NSDictionary *)[dicData valueForKey:key]]];
            continue;
        }
        //拼接setXXX方法
        NSString * strSetMethod = [NSString stringWithFormat:@"%@%@%@",@"set",[strKey capitalizedString],@":"];
        SEL setMethod = NSSelectorFromString(strSetMethod);
        [self performSelector:setMethod withObject:[dicData valueForKey:key]];
    }
    return self;
}

@end
