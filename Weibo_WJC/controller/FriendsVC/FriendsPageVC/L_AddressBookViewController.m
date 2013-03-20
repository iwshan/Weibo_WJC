//
//  L_AddressBookViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_AddressBookViewController.h"

@interface L_AddressBookViewController ()

@end

@implementation L_AddressBookViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 320, 100)];
    imgView.image = [UIImage imageNamed:@"findfriends_contacts_uploading"];
    [self.view addSubview:imgView];
    [imgView release];

    UILabel * aLab = [[UILabel new]autorelease];
    aLab.frame = CGRectMake(0, 180, 320, 65);
    aLab.text = @"找出你的通讯录里哪些朋友开通了微博，\n我们会保护您的隐私，\n您的通讯不会被泄漏。";
    aLab.numberOfLines = 3;
    aLab.lineBreakMode = NSLineBreakByWordWrapping;
    aLab.font = [UIFont fontWithName:@"Arial" size:12];
    aLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:aLab];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 280, 320-50*2, 35);
    [button setTitle:@"启  用" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(actionButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)actionButton:(UIButton *)sender
{
    // TODO: 如果不成功的提示：
    if (1)
    {
        UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:@"提示"
                                                         message:@"无法获取通讯录"
                                                        delegate:nil
                                               cancelButtonTitle:@"好"
                                               otherButtonTitles: nil];
        [alertV show];
        [alertV release];
    }
    else
    {
        
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
