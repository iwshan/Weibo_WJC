//
//  L_QrCodeViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_QrCodeViewController.h"

@interface L_QrCodeViewController ()

@end

@implementation L_QrCodeViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

-(void)dealloc
{
    self.qrCodeImgV = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.qrCodeImgV = [[[UIImageView alloc]initWithFrame:CGRectMake(60, 20, 200, 200)]autorelease];
    // TODO: 获取自己的二维码图片：
    self.qrCodeImgV.image = [UIImage imageNamed:@"findfriends_tab_qrcode"];
    [self.view addSubview:self.qrCodeImgV];
    
    UITextField * qrCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 240, 320, 30)];
    qrCodeTextField.enabled = NO;
    qrCodeTextField.textAlignment = NSTextAlignmentCenter;
    qrCodeTextField.font = [UIFont fontWithName:@"Arial" size:12];
    qrCodeTextField.text = @"扫描上面的二维码，关注我吧";
    [self.view addSubview:qrCodeTextField];
    [qrCodeTextField release];
    
    UIButton * shareQrCodeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareQrCodeButton.frame = CGRectMake(50, 270, 220, 35);
    [shareQrCodeButton setTitle:@"分享我的二维码" forState:UIControlStateNormal];
    [shareQrCodeButton addTarget:self
                          action:@selector(actionShareButton:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareQrCodeButton];
    
    UIButton * swapButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    swapButton.frame = CGRectMake(50, 320, 220, 35);
    [swapButton setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [swapButton addTarget:self
                   action:@selector(actionSwapButton:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:swapButton];
        
}

#pragma mark ---ActinoButton---
-(void)actionShareButton:(UIButton *)sender
{
    // TODO: share QrCode:
    
}

-(void)actionSwapButton:(UIButton *)sender
{
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"ShowQrCode" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
