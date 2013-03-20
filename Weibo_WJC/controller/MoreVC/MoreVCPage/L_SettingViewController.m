//
//  L_SettingViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_SettingViewController.h"

@interface L_SettingViewController ()

@end

@implementation L_SettingViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        NSArray * tempName0 = [NSArray arrayWithObjects:@"字号设置", nil];
        NSArray * tempName1 = [NSArray arrayWithObjects:@"上传图片质量", nil];
        NSArray * tempName2 = [NSArray arrayWithObjects:@"提示音",@"新消息提醒", nil];
        NSArray * tempName3 = [NSArray arrayWithObjects:@"多语言环境", nil];
        NSArray * tempName4 = [NSArray arrayWithObjects:@"清除图片缓存",@"清空搜索历史", nil];
        self.cellNameArray = [NSMutableArray arrayWithObjects:tempName0,tempName1,tempName2,tempName3,tempName4, nil];
        
    }
    return self;
}

-(void)dealloc
{
    self.cellNameArray = nil;
    self.tableView = nil;
    
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
    // TODO:隐藏TarBar:
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-40-44) style:UITableViewStyleGrouped]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    T_Sys_Btn * writeBtn = [T_Sys_Btn buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, 60, 30);
    [writeBtn setTitle:@"返回" forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(actionLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * wrtItem = [[[UIBarButtonItem alloc]initWithCustomView:writeBtn] autorelease];
    self.navigationItem.leftBarButtonItem = wrtItem;

    self.title = @"设置";
    
}

#pragma mark ---ActionButton---
-(void)actionLeftButton:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [sender removeFromSuperview];
    
}

#pragma mark -----UITableViewDataSource-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellNameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[self.cellNameArray objectAtIndex:section]).count;
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
    
    // TODO: 计算出是哪组上哪行的Cell公式?
    cell.textLabel.text = [((NSArray *)[self.cellNameArray objectAtIndex:indexPath.section])objectAtIndex:indexPath.row];
    
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
    return 0.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
