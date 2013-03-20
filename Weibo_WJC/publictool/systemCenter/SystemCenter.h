//
//  SystemCenter.h
//  Weibologin
//
//  Created by TRALIN on 13-1-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SinaWeibo.h"

@interface SystemCenter : NSObject

@property (nonatomic , retain) NSMutableArray * SysDataSurc;
@property (nonatomic , retain) SinaWeibo * SysSina;

+(id)getInstance;

@end
