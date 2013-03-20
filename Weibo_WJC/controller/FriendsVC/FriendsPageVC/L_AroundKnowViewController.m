//
//  L_AroundKnowViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_AroundKnowViewController.h"

@interface L_AroundKnowViewController ()

@end


// TODO: google 地图定位：

@implementation L_AroundKnowViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.cellDataArray = [[[NSMutableArray alloc]init]autorelease];
        [self.cellDataArray addObject:@""];
        
    }
    return self;
}

-(void)dealloc
{
    self.tableView = nil;
    self.cellDataArray = nil;
    
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.Hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView  = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-44-40)
                                                   style:UITableViewStylePlain]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
        
    
    
}

#pragma mark -----UITableViewDataSource-----

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    L_FriendAroundCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell)
    {
        cell = [[[L_FriendAroundCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier]autorelease];
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: 推出 个人主页： 【根据枚举值的不同调用不同的方法】
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellDataArray.count;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat f = 65.0f;
    return f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

#pragma mark ---上拉刷新----




#pragma mark ---下拉刷新---




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
