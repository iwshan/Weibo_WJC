//
//  L_ZBarSwapViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_ZBarSwapViewController.h"

@interface L_ZBarSwapViewController ()

@end

@implementation L_ZBarSwapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
//    self.tabBarController.tabBar.hidden = YES;
//    self.hidesBottomBarWhenPushed = YES;
//    NSLog(@"%@", self.tabBarController.tabBar);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    都是调试打印的代码
//    UIView * tarBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 460-49+15, 320, 49)];
//    tarBarView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:tarBarView];
//    [tarBarView release];
    
//    for (UIView * aView in [self.view subviews]) {
//        NSLog(@"%@",aView);
//        if ([aView isKindOfClass:[UIView class]]) {
////            aView.hidden = YES;
//        }
//    }
    
    self.view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
    
    UIView * topView = [[UIView new]autorelease];
    topView.frame = CGRectMake(0, 20, screenWidth, 44);
    topView.backgroundColor = SysColor;
    topView.layer.shadowColor = [UIColor blackColor].CGColor;
    topView.layer.shadowOffset = CGSizeMake(0, 3);
    topView.layer.shadowOpacity = 0.4;
    
    UILabel * titleLab = [[UILabel new]autorelease];
    titleLab.backgroundColor = ClearColor;
    titleLab.frame = CGRectMake(0, 0, 200, 30);
    titleLab.center = CGPointMake(160, 22);
    titleLab.text = @"二维码扫描";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont fontWithName:@"Helvetica" size:18];
    titleLab.textColor = [UIColor whiteColor];
    [topView addSubview:titleLab];

    T_Sys_Btn * quitBtn = [[[T_Sys_Btn alloc]initWithFrame:CGRectMake(10, 7, 60, 30)]autorelease];
    [quitBtn setTitle:@"取消" forState:UIControlStateNormal];
    [quitBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:quitBtn];
    
    [self.view addSubview:topView];
    
    UIView * aView = [self.view.subviews objectAtIndex:0];
    aView.frame = CGRectMake(0, 44, screenWidth, screenHeight-44);
    UIView * bView = [self.view.subviews objectAtIndex:1];
    bView.hidden = YES;

//    都是调试打印的代码
//    NSLog(@"%@",bView);
//    for (UIView * cView in bView.subviews) {
//        NSLog(@"%@",cView);
//    }
    
}

-(void)dismissSelf{
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
