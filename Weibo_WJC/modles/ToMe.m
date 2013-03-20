//
//  ToMe.m
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "ToMe.h"

@implementation ToMe

-(Class)getUserClass{
    return [User class];
}

-(Class)getStatusClass{
    return [Microblog class];
}


@end
