//
//  TAnimationMake.m
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-2.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TAnimationMake.h"

@implementation TAnimationMake

+(CAAnimationGroup *) AnimationForAppear{
    
    CABasicAnimation * moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(320, 440)];
//试值备份    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 210)];
    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //* scaleAni
    CABasicAnimation * scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = [NSNumber numberWithDouble:0];
    scaleAni.toValue = [NSNumber numberWithDouble:1];
    
    //* transformAni
    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    CGAffineTransform transform = CGAffineTransformMake(1, -0.9, -0.9, 1, 0, 0);
    transformAni.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform)];
    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformIdentity)];
    
    //* AniGroup
    CAAnimationGroup * AniGroup = [CAAnimationGroup animation];
    AniGroup.animations = [NSArray arrayWithObjects:moveAni,scaleAni,transformAni,nil];
    AniGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    AniGroup.duration = 0.7;
    AniGroup.fillMode = kCAFillModeForwards;
    AniGroup.removedOnCompletion = NO;
    
    return AniGroup;
}

+(CAAnimationGroup *) AnimationForDisappear{
    CABasicAnimation * moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
    //    moveAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 210)];

    //试值备份    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(-640, 960)];
    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, -220)];

    //* scaleAni
    CABasicAnimation * scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = [NSNumber numberWithDouble:1];
    scaleAni.toValue = [NSNumber numberWithDouble:0];
    
    //* transformAni
    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    CGAffineTransform transform = CGAffineTransformMake(1, -0.9, -0.9, 1, 0, 0);
    transformAni.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform)];
    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformIdentity)];
    
    //* AniGroup
    CAAnimationGroup * AniGroup = [CAAnimationGroup animation];
    AniGroup.animations = [NSArray arrayWithObjects:moveAni,scaleAni,transformAni,nil];
    AniGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    AniGroup.duration = 2;
    AniGroup.fillMode = kCAFillModeForwards;
    AniGroup.removedOnCompletion = NO;
    
    return AniGroup;
}

+(CABasicAnimation *) AnimationForSkiteIn{
    CABasicAnimation * skiteIn = [CABasicAnimation animationWithKeyPath:@"transform"];
    skiteIn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformMake(1, 0, 0, 1, 320, 0))];
    skiteIn.duration = 0.4;
    skiteIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return skiteIn;
}

@end
