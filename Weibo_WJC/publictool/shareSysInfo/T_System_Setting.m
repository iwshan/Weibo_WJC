//
//  T_System_Setting.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-13.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_System_Setting.h"

@implementation T_System_Setting

@synthesize faceDic , faceWordDic , facial , setColor;

-(void)dealloc{
    self.facial = nil;
    self.faceDic = nil;
    self.faceWordDic = nil;
    self.setColor = nil;
    [super dealloc];
}

static T_System_Setting * sysSetting = nil;

+(id)shareSystemInfo{
    if (!sysSetting) {
        sysSetting = [[T_System_Setting alloc]init];
    }
    return sysSetting;
}

@end
