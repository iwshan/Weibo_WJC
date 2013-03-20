//
//  SystemCenter.m
//  Weibologin
//
//  Created by TRALIN on 13-1-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "SystemCenter.h"

@implementation SystemCenter
@synthesize SysDataSurc = _SysDataSurc , SysSina = _SysSina;

-(void)dealloc{
    self.SysSina= nil;
    self.SysDataSurc = nil;
    [super dealloc];
}

static SystemCenter *instance =  nil;

+(id)getInstance{
    if(!instance){
        instance = [[SystemCenter alloc]init];
    }
    return instance;
}

@end
