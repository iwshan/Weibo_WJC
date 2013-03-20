//
//  T_4ValKey.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-10.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_4ValKey.h"

@implementation T_4ValKey

@synthesize iocnUrl , userName , context , profileUrl , cellType;

-(void)dealloc{
    self.iocnUrl = nil;
    self.userName = nil;
    self.context = nil;
    self.profileUrl = nil;;
    
    [super dealloc];
}


@end
