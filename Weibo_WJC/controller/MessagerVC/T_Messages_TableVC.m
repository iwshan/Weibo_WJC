//
//  T_Messages_TableVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Messages_TableVC.h"

@interface T_Messages_TableVC ()

@end

@implementation T_Messages_TableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = GrayBG;
    self.tableView.separatorColor = ClearColor;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 28;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * nameLab = [[UILabel new]autorelease];
    nameLab.frame = CGRectMake(0, 0, 320, 26);
    nameLab.font = GirlFonts16;
    nameLab.textAlignment = NSTextAlignmentCenter;
    //nameLab.textColor = SysColor;
    nameLab.text = @"秘密私信";
    nameLab.shadowColor = [UIColor whiteColor];
    nameLab.shadowOffset = CGSizeMake(1, 1);
    nameLab.backgroundColor = ClearColor;
    
    UIImageView * bottomLine = [[[UIImageView alloc]initWithImage:bottomLineImg]autorelease];
    bottomLine.frame = CGRectMake(5, 26, 310, 2);
    
    UIView * aView = [[UIView new]autorelease];
    aView.frame= CGRectMake(0, 0, 320, 28);
    
    [aView addSubview:bottomLine];
    [aView addSubview:nameLab];
    return aView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }
    
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"usericondefaut" ofType:@"png"]];
    cell.textLabel.text = @"新浪小助手";
    cell.textLabel.font = GirlFonts16;
    
    cell.detailTextLabel.text = @"用户你好，你B哥数据的不到就是没东西显示……囧";
    cell.detailTextLabel.font = Arial12;
    
    cell.accessoryView = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profile_cover_arrow"]]autorelease];
    
    UIImageView * bottomLine = [[[UIImageView alloc]initWithImage:bottomLineImg]autorelease];
    bottomLine.frame = CGRectMake(5, 58, 310, 2);
    [cell addSubview:bottomLine];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
