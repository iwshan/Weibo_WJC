//
//  HomeNav.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "HomeNav.h"

@interface HomeNav ()

@end

@implementation HomeNav

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
    self.view.frame = CGRectMake(0, 0, screenWidth, screenHeight - 60);
    [self.navigationBar  setBackgroundImage:nav_Bg forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBackgroundColor:SysColor];
    self.navigationBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.navigationBar.layer.shadowOffset = CGSizeMake(0, 3);
    self.navigationBar.layer.shadowOpacity = 0.4;
    
}

-(void)viewWillAppear:(BOOL)animated{
    CGRect rect = self.view.frame;
    CGRect mutRect = self.view.frame;
    
    //anchorPoint设置后frame受影响颇大 这里采用以下方法调试 解决 但不完美 待调整
    //    mutRect.origin.x = -self.currVC.view.frame.size.width/2;
    mutRect.origin.y = self.view.frame.size.height;
    self.view.frame = mutRect;
    self.view.layer.anchorPoint = CGPointMake(1, 1);
    
    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAni.duration = 0.35;
    transformAni.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformMake(0.1, 0.09, 0.09, 0.1, 0, 0))];//appear need turn
    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformIdentity)];
    //    transformAni.fillMode = kCAFillModeForwards;
    //    transformAni.removedOnCompletion = NO;
    
    [self.view.layer addAnimation:transformAni forKey:@"transform"];
    self.view.frame = rect;
    
    //    [self.view.layer addAnimation:[TAnimationMake AnimationForAppear] forKey:@"disappear"];
    
    //    NSLog(@"%s",__func__);
    
}

@end

