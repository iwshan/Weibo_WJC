//
//  L_ReadingModelViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_ReadingModelViewController.h"

@interface L_ReadingModelViewController ()

@end

@implementation L_ReadingModelViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.cellDataArray = [[[NSMutableArray alloc]init]autorelease];
        
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
    self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-44-40)
                                                  style:UITableViewStyleGrouped]autorelease];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark -----UITableViewDataSource-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[self.cellDataArray objectAtIndex:section]).count;
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
    
    cell.textLabel.text = [((NSArray *)[self.cellDataArray objectAtIndex:indexPath.section])objectAtIndex:indexPath.row];
    
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
    //TOOD: 难点啊！！
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
