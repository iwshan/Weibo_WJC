//
//  L_GuessKnowViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_GuessKnowViewController.h"

@interface L_GuessKnowViewController ()

@end

@implementation L_GuessKnowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.cellDataArray = [[[NSMutableArray alloc]init]autorelease];
        [self.cellDataArray addObject:@""];
        // Custom initialization
        
    }
    return self;
}

-(void)dealloc
{
    self.tableView = nil;
    self.cellDataArray = nil;
    
    [super dealloc];
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
    L_FriendGuessCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell)
    {
        cell = [[[L_FriendGuessCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier]autorelease];
    }
    
    
    UIButton * focusOnBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    focusOnBtn.frame = CGRectMake(250, 10, 50, 35);
    [focusOnBtn setTitle:@"加关注" forState:UIControlStateNormal];
    [focusOnBtn addTarget:self
                   action:@selector(actionCellfocusOnBtn:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:focusOnBtn];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: 推出 个人主页：
    
    
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

#pragma mark ---actionCellfocusOnBtn---
-(void)actionCellfocusOnBtn:(UIButton *)sender
{
    UIButton *butn=(UIButton *)sender;
    
    NSString *title=[butn titleForState:UIControlStateNormal];
    if ([title isEqualToString:@"加关注"]) {
         [butn setTitle:@"取消关注" forState:UIControlStateNormal];
    }else{
        [butn setTitle:@"加关注" forState:UIControlStateNormal];
    }
}

#pragma mark ---下拉刷新----
// 将已关注的删除；


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
