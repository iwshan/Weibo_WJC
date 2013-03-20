//
//  L_WeiboPageViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_WeiboPageViewController.h"

@interface L_WeiboPageViewController ()

@end

@implementation L_WeiboPageViewController

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
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    navView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:navView];
    [navView release];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.center = navView.center;
    titleLabel.text = @"微博";
    titleLabel.font = [UIFont fontWithName:@"Arial" size:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
    [titleLabel release];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateNormal];
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
    HomeMainVC * homeMainV = [[HomeMainVC alloc]init];
    [self.navigationController pushViewController:homeMainV animated:YES];
    [homeMainV release];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
