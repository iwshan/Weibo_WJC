//
//  TMainViewController.m
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-1.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TMainViewController.h"

@interface TMainViewController ()

@end

@implementation TMainViewController

@synthesize Controllers , selected , currVC , contentView;

-(void)dealloc{
    self.contentView = nil;
    self.currVC = nil;
    self.Controllers = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currIndex = 0;
        self.selected = 0;
        self.Controllers = [[NSMutableArray new] autorelease];
        self.contentView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60)]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
                                                                       
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor cyanColor];
    
    UIView * tabBarView = [[UIView new]autorelease];
    tabBarView.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, 320, 40);
    tabBarView.backgroundColor = [UIColor blueColor];

    
    NSArray * btnTit = [NSArray arrayWithObjects:@"page1",@"page2",@"page3",@"page4", nil];
    UIButton * aBtn;
    for (int i = 0; i<4; i++) {
        aBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        aBtn.frame = CGRectMake( 80*i, 0, 80, 40);
        NSString * titlStr = [btnTit objectAtIndex:i];
        [aBtn setTitle:titlStr forState:UIControlStateNormal];
        aBtn.tag = i;
//        SEL btnSel = NSSelectorFromString([NSString stringWithFormat:@"%@Sel",titlStr]);
        [aBtn addTarget:self action:@selector(TabBarButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarView addSubview:aBtn];
    }
    [self.view addSubview:tabBarView];

    TPassPageViewController * aPage = [[TPassPageViewController new]autorelease];
    aPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    [self.Controllers addObject:aPage];
//    aPage.editing = NO;
    
    TPassPageViewController * bPage = [[TPassPageViewController new]autorelease];
    bPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    [self.Controllers addObject:bPage];
//    bPage.editing = NO;
    
    TPassPageViewController * cPage = [[TPassPageViewController new]autorelease];
    cPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    [self.Controllers addObject:cPage];
//    cPage.editing = NO;
    
    TPassPageViewController * dPage = [[TPassPageViewController new]autorelease];
    dPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    [self.Controllers addObject:dPage];
//    dPage.editing = NO;
    
    NSLog(@"%@",self.Controllers);

    self.currVC = [self.Controllers objectAtIndex:currIndex];
//    self.currVC.editing = YES;
    [self.contentView addSubview:self.currVC.view];


    //------------------------------------------------------------------------------------
    /*手势部分
    
    UISwipeGestureRecognizer * aSwipe;
    aSwipe = [[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)]autorelease];
    aSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:aSwipe];
    
    aSwipe = [[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)]autorelease];
    aSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:aSwipe];
    */
    //------------------------------------------------------------------------------------

    [super viewDidLoad];

}

/////////////////

-(void)panFunc:(UIPanGestureRecognizer *)sender{
    //Function of panGestureRecongnizer
    if (sender.state == UIGestureRecognizerStateBegan) {
        startP = [sender locationInView:sender.view];
    }
    endP= [sender locationInView:sender.view];
    CGFloat Dx = startP.x - endP.x;
    
    self.view.center = CGPointMake(self.view.center.x - (Dx/10), self.view.center.y);
    NSLog(@"%f",self.view.center.x);
    if ((self.view.center.x < 320)&&(self.view.center.x > 0)) {
        self.view.center = CGPointMake(self.view.center.x - Dx, self.view.center.y);
    }
    
}

-(void)swipeLeft:(UISwipeGestureRecognizer *)sender{
    NSLog(@"left");
}

-(void)swipeRight:(UISwipeGestureRecognizer *)sender{
    NSLog(@"right");
    [self.currVC.view.layer addAnimation:[TAnimationMake AnimationForSkiteIn] forKey:@"skiteIn"];
}

/////////////////

-(void)TabBarButtonAct:(UIButton *)sender{
    /*
    self.currVC = [self.Controllers objectAtIndex:self.selected];
    CAAnimationGroup * disappAni = [TAnimationMake AnimationForDisappear];
    disappAni.delegate = self;
    NSLog(@"%f,%f",self.currVC.view.layer.anchorPoint.x,self.currVC.view.layer.anchorPoint.y);
    [self.currVC.view.layer addAnimation:disappAni forKey:@"disappear"];
    self.selected = sender.tag;*/
    /*
     CGRect rect = self.currVC.view.frame;
     CGRect mutRect;
     
     //anchorPoint设置后frame受影响颇大 这里采用以下方法调试 解决 但不完美 待调整
     //    mutRect.origin.x = -self.currVC.view.frame.size.width/2;
     mutRect.origin.y = self.currVC.view.frame.size.height;
     self.currVC.view.frame = mutRect;
     self.currVC.view.layer.anchorPoint = CGPointMake(0, 1);
     
     CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
     transformAni.duration = 0.35;
     transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformMake(0.1, -0.09, -0.09, 0.1, 0, 0))];
     transformAni.delegate = self;
     //    transformAni.fillMode = kCAFillModeForwards;
     //    transformAni.removedOnCompletion = NO;
     
     [self.currVC.view.layer addAnimation:transformAni forKey:@"transform"];
     self.currVC.view.frame = rect;
     */
    
    self.currVC = [self.Controllers objectAtIndex:self.selected];
    [self DisappearViewWith:self.currVC.view];
//    self.currVC.isEditing = NO;????????????
    self.selected = sender.tag;
}

-(void)DisappearViewWith:(UIView *)aView{
    CGRect rect = aView.frame;
    CGRect mutRect;
    
    //anchorPoint设置后frame受影响颇大 这里采用以下方法调试 解决 但不完美 待调整
    //    mutRect.origin.x = -self.currVC.view.frame.size.width/2;
    mutRect.origin.y = aView.frame.size.height;
    aView.frame = mutRect;
    aView.layer.anchorPoint = CGPointMake(0, 1);
    
    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAni.duration = 0.35;
    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformMake(0.1, -0.09, -0.09, 0.1, 0, 0))];
    transformAni.delegate = self;
    //    transformAni.fillMode = kCAFillModeForwards;
    //    transformAni.removedOnCompletion = NO;
    
    [aView.layer addAnimation:transformAni forKey:@"transform"];
    aView.frame = rect;

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //!!!!!!!!!!!!此处需要优化 若是把动画手动加到appear的view上那就太二了 要在本页结束
    self.currVC = [self.Controllers objectAtIndex:currIndex];
    [self.currVC.view removeFromSuperview];
    self.currVC = [self.Controllers objectAtIndex:self.selected];
    [self.contentView addSubview:currVC.view];
    currIndex = self.selected;
}

@end
/*tmp code
 -(void)removeContentView{
 for (UIView * aView in [self.contentView subviews]) {
 [aView removeFromSuperview];
 }
 }
 
 -(void)page1Sel{
 self.currVC = [self.Controllers objectAtIndex:self.selected];
 [self.currVC.view.layer addAnimation:[TAnimationMake AnimationForDisappear] forKey:@"disappear"];
 self.selected = 0;
 NSLog(@"1");
 }
 -(void)page2Sel{
 self.currVC = [self.Controllers objectAtIndex:self.selected];
 [self.currVC.view.layer addAnimation:[TAnimationMake AnimationForDisappear] forKey:@"disappear"];
 self.selected = 1;
 NSLog(@"2");
 
 }
 -(void)page3Sel{
 self.currVC = [self.Controllers objectAtIndex:self.selected];
 [self.currVC.view.layer addAnimation:[TAnimationMake AnimationForDisappear] forKey:@"disappear"];
 self.selected = 2;
 NSLog(@"3");
 }
 -(void)page4Sel{
 self.currVC = [self.Controllers objectAtIndex:self.selected];
 [self.currVC.view.layer addAnimation:[TAnimationMake AnimationForDisappear] forKey:@"disappear"];
 self.selected = 3;
 NSLog(@"4");
 }
 */