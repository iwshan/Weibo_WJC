//
//  TPassPageViewController.m
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-1.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TPassPageViewController.h"
#import "TMainViewController.h"

@interface TPassPageViewController ()

@end

@implementation TPassPageViewController

float randomColor() {
    float val = arc4random() % 256 / 256.0;
    return val;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.layer.anchorPoint = CGPointMake(0, 0);
        a = 1;
        self.view.backgroundColor = [UIColor colorWithRed:randomColor() green:randomColor() blue:randomColor() alpha:1];
    }
    return self;
}


- (void)viewDidLoad
{
    UIButton * aBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    aBtn.frame = CGRectMake(50, 50, 100, 40);//CGRectContainsPoint(CGRectMake(0, 0, 100, 40), CGPointMake(160, 320));
    [aBtn addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aBtn];
    
    aLab = [[UILabel new]autorelease];
    aLab.frame = CGRectMake(170, 50, 100, 40);
    aLab.text = @"0";
    [self.view addSubview:aLab];
    
    [super viewDidLoad];
}

-(void)changeValue:(id)s{
    aLab.text = [NSString stringWithFormat:@"%d",a++];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//-(void)viewWillDisappear:(BOOL)animated{
//    //* moveAni
//    CABasicAnimation * moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
//    moveAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 210)];
//    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 0)];
//    //* scaleAni
//    CABasicAnimation * scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAni.fromValue = [NSNumber numberWithDouble:0];
//    scaleAni.toValue = [NSNumber numberWithDouble:1];
//    
//    //* transformAni
//    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
//    CGAffineTransform transform = CGAffineTransformMake(1, 0.9, 0.9, 1, 0, 0);
//    transformAni.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform)];
//    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformIdentity)];
//    
//    //* AniGroup
//    CAAnimationGroup * AniGroup = [CAAnimationGroup animation];
//    AniGroup.animations = [NSArray arrayWithObjects:moveAni,scaleAni,transformAni,nil];
//    AniGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    AniGroup.duration = 0.7;
//    AniGroup.fillMode = kCAFillModeForwards;
//    AniGroup.removedOnCompletion = YES;
//    
//    [self.view.layer addAnimation:AniGroup forKey:@"disappear"];
//    NSLog(@"%s",__func__);
//}

-(void)viewWillAppear:(BOOL)animated{

    CGRect rect = self.view.frame;
    CGRect mutRect;
    
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

    NSLog(@"%s",__func__);
    
}

@end
