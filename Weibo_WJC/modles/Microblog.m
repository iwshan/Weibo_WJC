//
//  Microblog.m
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "Microblog.h"
#import "RequestUrlModel.h"
#import "RequestUrlToModel.h"
@implementation Microblog

-(Class)getUserClass{
    return [User class];
}

-(Class)getRetweetedstatusClass{
    return [Microblog class];
}

@end
