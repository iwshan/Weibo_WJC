//
//  RequestUrlModel.m
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "RequestUrlModel.h"

@implementation RequestUrlModel

-(id)initWithKeyUrl:(NSString *)keyUrl WithModelName:(NSString *)modelName WithParseNode:(NSString *)parseName{
    if (self = [super init]) {
        self.keyUrl = keyUrl;
        self.modelName = modelName;
        self.parseNode = parseName;
    }
    return self;
}


@end
