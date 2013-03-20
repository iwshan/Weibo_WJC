//
//  L_AccountManagementViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_AccountManagementViewController.h"

@interface L_AccountManagementViewController ()

@end

@implementation L_AccountManagementViewController

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
    self.tableView = nil;
    self.userNameStr = nil;
    
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
    // TODO: hidden TarBar: 
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // NavCtrl:
    UIView * topView = [[UIView new]autorelease];
    topView.frame = CGRectMake(0, 0, 320, 44);
    topView.backgroundColor = [UIColor brownColor];
    topView.layer.shadowColor = [UIColor blackColor].CGColor;
    topView.layer.shadowOffset = CGSizeMake(0, 3);
    topView.layer.shadowOpacity = 0.4;
    
    T_Sys_Btn * backButton = [T_Sys_Btn buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 7, 60, 30);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self
                 action:@selector(actionBackButton:)
       forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    
    T_Sys_Btn * editButton = [[[T_Sys_Btn alloc]initWithFrame:CGRectMake(250, 7, 60, 30)]autorelease];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton addTarget:self
                   action:@selector(actionEditButton:)
         forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:editButton];

    UILabel * titleLab = [[UILabel new]autorelease];
    titleLab.backgroundColor = ClearColor;
    titleLab.frame = CGRectMake(0, 0, 200, 30);
    titleLab.center = CGPointMake(160, 22);
    titleLab.text = @"账号管理";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont fontWithName:@"Helvetica" size:18];
    titleLab.textColor = [UIColor whiteColor];
    [topView addSubview:titleLab];
    
    [self.view addSubview:topView];
    
    self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 460-40-44)
                                                 style:UITableViewStyleGrouped]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    //
    self.userNameStr = @"用户名";
    [self.view bringSubviewToFront:topView];
    
}

#pragma mark ---NavCtrlButton---
-(void)actionBackButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)actionEditButton:(UIButton *)sender
{
    // TODO: edit tableView:
    
    
}

#pragma mark - Table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //不重用Cell:
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%d-%d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]autorelease];
    }
    //
    UIImageView * iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    iconImageView.image = [UIImage imageNamed:@""];
    [cell addSubview:iconImageView];
    [iconImageView release];
    UIImageView * accImageView = [[UIImageView alloc]initWithFrame:CGRectMake(250, 5, 15, 15)];
    accImageView.image = [UIImage imageNamed:@""];
    [cell addSubview:accImageView];
    [accImageView release];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 200, 34)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = self.userNameStr;
    
    [cell addSubview:titleLabel];
    [titleLabel release];
    
    return cell;
    
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    // TODO: 推出用户主页;
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

#pragma mark ---FooterButton---
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * footerView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)]autorelease];
    
    footerView.userInteractionEnabled = YES;
    footerView.backgroundColor = [UIColor clearColor];
    
    UIButton * registeredButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registeredButton.frame = CGRectMake(10, 15, 100, 35);
    [registeredButton setTitle:@"注册" forState:UIControlStateNormal];
    [registeredButton addTarget:self
                         action:@selector(actionRegisteredButton:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [footerView addSubview:registeredButton];
    
    UIButton * addAccountButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addAccountButton.frame = CGRectMake(180, 15, 100, 35);
    [addAccountButton setTitle:@"添加账号" forState:UIControlStateNormal];
    addAccountButton.userInteractionEnabled = YES;
    [addAccountButton addTarget:self
                         action:@selector(actionAddAccountButton:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [footerView addSubview:addAccountButton];
    
    return footerView;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    
}

#pragma mrak ----ActionButton---
//注销：
-(void)actionRegisteredButton:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    
}
// 添加账号：
-(void)actionAddAccountButton:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
