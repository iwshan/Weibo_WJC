//
//  T_Notice_TableVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Notice_TableVC.h"

@interface T_Notice_TableVC ()

@end

@implementation T_Notice_TableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
   
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }
    
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"usericondefaut" ofType:@"png"]];
    cell.textLabel.text = @"呼唤B哥";
    cell.textLabel.font = GirlFonts16;
    
    cell.detailTextLabel.text = @"我坚毅的告诫自己，没事有B哥，数据总会有的……";
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
