//
//  T_About_VC.m
//  Weibo_WJC
//
//  Created by Liu on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_About_VC.h"

@interface T_About_VC ()

@end

@implementation T_About_VC

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
    self.title = @"关于";
    self.view.backgroundColor = GrayBG;

    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 24);
    backBtn.showsTouchWhenHighlighted = YES;
    [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[[UIBarButtonItem alloc]initWithCustomView:backBtn]autorelease];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIImageView * logoView = [[UIImageView new]autorelease];
    logoView.frame = CGRectMake(0, 0, 175, 75);
    UIImage * logoImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"about_sina_logo" ofType:@"png"]];
    logoView.image = logoImg;
    logoView.center = CGPointMake(160, 70);
    [self.view addSubview:logoView];
    
    UILabel * infoLab = [[UILabel new]autorelease];
    infoLab.frame = CGRectMake(0, 0, 200, 20);
    infoLab.text = @"纯色微博Iphone版";
    infoLab.font = GirlFonts16;
    infoLab.backgroundColor = ClearColor;
    infoLab.shadowColor = [UIColor whiteColor];
    infoLab.shadowOffset = CGSizeMake(1, 1);
    infoLab.textColor = [UIColor grayColor];
    infoLab.textAlignment = NSTextAlignmentCenter;
    infoLab.center = CGPointMake(160, 130);
    [self.view addSubview:infoLab];
    
    UILabel * numLab = [[UILabel new]autorelease];
    numLab.frame = CGRectMake(0, 0, 100, 20);
    numLab.text = @"1.0.0 beat";
    numLab.font = GirlFonts16;
    numLab.backgroundColor = ClearColor;
    numLab.shadowColor = [UIColor whiteColor];
    numLab.shadowOffset = CGSizeMake(1, 1);
    numLab.textColor = [UIColor grayColor];
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.center = CGPointMake(160, 160);
    [self.view addSubview:numLab];
    
    UIImageView * bottomLine = [[UIImageView new]autorelease];
    bottomLine.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"contentSprarator" ofType:@"png"]];
    bottomLine.frame = CGRectMake(25, 190, 270, 2);
    [self.view addSubview:bottomLine];
    
    UILabel * phoneLab = [[UILabel new]autorelease];
    phoneLab.frame = CGRectMake(0, 0, 230, 20);
    phoneLab.text = @"客服电话（不方便透露）";
    phoneLab.font = GirlFonts16;
    phoneLab.backgroundColor = ClearColor;
    phoneLab.shadowColor = [UIColor whiteColor];
    phoneLab.shadowOffset = CGSizeMake(1, 1);
    phoneLab.textColor = [UIColor grayColor];
    phoneLab.textAlignment = NSTextAlignmentCenter;
    phoneLab.center = CGPointMake(160, 210);
    [self.view addSubview:phoneLab];
    
    UIButton * phonBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    phonBtn1.frame = CGRectMake(0, 0, 230, 36);
    phonBtn1.center = CGPointMake(160, 250);
    [phonBtn1 setTitle:@"个人电话: 133-0000-0000" forState:UIControlStateNormal];
    [phonBtn1 setTintColor:GrayBG];
    phonBtn1.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"about_phone_icon" ofType:@"png"]];
//    phonBtn1.imageEdgeInsets = CGPointMake(-100, 0);
    [self.view addSubview:phonBtn1];
    
    UIButton * phonBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    phonBtn2.frame = CGRectMake(0, 0, 230, 36);
    phonBtn2.center = CGPointMake(160, 300);
    [phonBtn2 setTitle:@"个人电话: 133-0000-0000" forState:UIControlStateNormal];
    [phonBtn2 setTintColor:GrayBG];
    [self.view addSubview:phonBtn2];
    
    UILabel * form = [[UILabel new]autorelease];
    form.frame = CGRectMake(0, 0, 320, 20);
    form.text = @"哥儿几个 版权所有";
    form.font = Arial10;
    form.backgroundColor = ClearColor;
    form.textColor = [UIColor grayColor];
    form.textAlignment = NSTextAlignmentCenter;
    form.center = CGPointMake(160, [UIScreen mainScreen].bounds.size.height - 130);
    
    [self.view addSubview:form];
    
    UILabel * copyright = [[UILabel new]autorelease];
    copyright.frame = CGRectMake(0, 0, 320, 20);
    copyright.text = @"Copyright © by LaoWu BGe XiaoCui.All Rights Reserved";
    copyright.font = Arial10;
    copyright.backgroundColor = ClearColor;
    copyright.textColor = [UIColor grayColor];
    copyright.textAlignment = NSTextAlignmentCenter;
    copyright.center = CGPointMake(160, [UIScreen mainScreen].bounds.size.height - 115);
    [self.view addSubview:copyright];
}

-(void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
