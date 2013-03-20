//
//  T_System_Setting.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-13.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface T_System_Setting : NSObject

@property (nonatomic , retain) NSDictionary * faceDic;
@property (nonatomic , retain) NSArray * facial;
@property (nonatomic , retain) NSDictionary * faceWordDic;
@property (nonatomic , retain) NSDictionary * setColor;

+(id)shareSystemInfo;

@end
