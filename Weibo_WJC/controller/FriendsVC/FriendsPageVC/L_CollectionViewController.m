//
//  L_CollectionViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_CollectionViewController.h"

@interface L_CollectionViewController ()

@end

@implementation L_CollectionViewController

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
	// Do any additional setup after loading the view.
    T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navView setBackgroundColor:SysColor];
    navView.layer.shadowColor = [UIColor blackColor].CGColor;
    navView.layer.shadowOffset = CGSizeMake(0, 3);
    navView.layer.shadowOpacity = 0.4;
    [self.view addSubview:navView];
    [navView release];
    //
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.center = navView.center;
    titleLabel.text = @"收藏";
    titleLabel.font = [UIFont fontWithName:@"Arial" size:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
    [titleLabel release];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
    [backButton addTarget:self
                   action:@selector(actionBackButton:)
         forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:backButton];
    
    UIButton * homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame = CGRectMake(320-44, 0, 44, 44);
    [homeButton setImage:[UIImage imageNamed:@"tabbar_home_selected"]
                forState:UIControlStateNormal];
    [homeButton addTarget:self
                   action:@selector(actionHomeButton:)
         forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:homeButton];
    
    
    
    
}

#pragma mark ----actionBackButton:
-(void)actionBackButton:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)actionHomeButton:(UIButton *)sender
{
    //
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
