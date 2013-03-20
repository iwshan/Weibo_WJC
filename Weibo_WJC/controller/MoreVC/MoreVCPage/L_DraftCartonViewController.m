//
//  L_DraftCartonViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_DraftCartonViewController.h"

@interface L_DraftCartonViewController ()

@end

@implementation L_DraftCartonViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.isHaveData = NO;//没有数据；
        self.cellDataArray = [[[NSMutableArray alloc]init]autorelease];// 从CoreData中取数据;
        [self.cellDataArray addObject:@"test"];
        
    }
    return self;
}

-(void)dealloc
{
    self.cellDataArray = nil;
    self.tableView = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-40-44)
                                                 style:UITableViewStylePlain]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (0 == self.cellDataArray.count)
    {
        self.isHaveData = NO;//没有数据；
    }
    else
    {
        self.isHaveData = YES;// 有数据；
    }
    
}

#pragma mark -----UITableViewDataSource-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isHaveData)
    {
        return self.cellDataArray.count;
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    L_DraftCartonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell)
    {
        cell = [[[L_DraftCartonCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier]autorelease];
    }
    
    if (self.isHaveData)
    {
        //TODO: 加载Cell数据:
        
        
    }
    else
    {
        //TODO: 设置Cell 不可以被点击；
        UILabel * textLabel = [[UILabel alloc]init];
        textLabel.frame = CGRectMake(0, 0, 150, 25);
        textLabel.center = cell.center;
        textLabel.text = @"暂无数据...";
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.backgroundColor = [UIColor clearColor];
        
        [cell addSubview:textLabel];
        [textLabel release];
    }
    
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isHaveData)
    {
        return 65.0f;
    }
    else
    {
        return 40.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}
 // Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isHaveData)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    // TODO: 推出写weibo面：【将本Cell上的数据带过去】
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
