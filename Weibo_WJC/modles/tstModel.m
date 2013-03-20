//
//  tstModel.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "tstModel.h"

@implementation tstModel

@synthesize created_at,
            idstr,
            text,
            thumbnail_pic,
            user_name,
            user_icon;

-(void)dealloc{
    self.created_at = nil;
    self.idstr = nil;
    self.text = nil;
    self.thumbnail_pic = nil;
    self.user_name = nil;
    self.user_icon = nil;
    [super dealloc];
}

@end
