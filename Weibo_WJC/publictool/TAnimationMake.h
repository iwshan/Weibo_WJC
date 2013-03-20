//
//  TAnimationMake.h
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-2.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface TAnimationMake : NSObject

+(CAAnimationGroup *) AnimationForAppear;
+(CAAnimationGroup *) AnimationForDisappear;
+(CABasicAnimation *) AnimationForSkiteIn;

+(CALayer *) shadowLayer;

@end
