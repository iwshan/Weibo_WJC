//
//  T_blogDetail_TableVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_blogDetail_TableVC.h"

@interface T_blogDetail_TableVC ()

@end

@implementation T_blogDetail_TableVC

@synthesize aBlog , commontArr;

-(void)dealloc{
    self.aBlog = nil;
    self.commontArr = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        sysSetting = [T_System_Setting shareSystemInfo];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = ClearColor;
    self.tableView.backgroundColor = GrayBG;
    self.title = @"微博正文";
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 24);
    backBtn.showsTouchWhenHighlighted = YES;
    [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[[UIBarButtonItem alloc]initWithCustomView:backBtn]autorelease];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

-(void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    float rows = 0;
    if (section == 0) {
        rows = 1;
    }else if(section == 1){
//        rows = self.commontArr.count;
        rows = 1;
    }
    
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        T_Main_Cell * cell = (T_Main_Cell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.height;
    }else{
        return [UIScreen mainScreen].bounds.size.height - 150;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *CellIdentifier1 = @"Cell";
        T_Main_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (cell == nil) {
            cell = [[[T_Main_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1]autorelease];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.blog = aBlog;
        [cell setInfo];
        
        return cell;
    }else{
        static NSString *CellIdentifier2 = @"Cell";
//        T_Prompt_A *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
//        if (cell == nil) {
//            cell = [[[T_Prompt_A alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2]autorelease];
//        }
        T_Prompt_B*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        if (cell == nil) {
            cell = [[[T_Prompt_B alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2]autorelease];
        }
        
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 45;
    }else{
        return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * aView = [[UIView new]autorelease];
    aView.frame = CGRectMake(0, 0, 320, 45);
//    aView.backgroundColor = [UIColor grayColor];
    
    UIButton * Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn1.frame = CGRectMake(10, 0, 70, 45);
    Btn1.titleLabel.font = GirlFonts16;
    [Btn1 setTitle:@"转发:0" forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [Btn1 setTitleColor:SysColor forState:UIControlStateHighlighted];
    [Btn1 setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Btn1.titleLabel.shadowOffset = CGSizeMake(1, 1);
    //Btn1.selected = YES;
    [aView addSubview:Btn1];
    
    //NSLog(@"%d",self.aBlog.repostscount);//我一样情难以堪
    //2013-03-17 13:21:33.325 Weibo_WJC[3136:c07] 135502720
    /*
    UILabel * Lab1 = [[UILabel new]autorelease];
    Lab1.frame = CGRectMake(10, 0, 40, 45);
    Lab1.text = @"转发:";
    Lab1.font = GirlFonts16;
    Lab1.backgroundColor = ClearColor;
    [aView addSubview:Lab1];
    
    
    UILabel * Lab2 = [[UILabel new]autorelease];
    Lab2.frame = CGRectMake(50, 0, 30, 45);
    Lab2.text = @"35";
    Lab2.textAlignment = NSTextAlignmentCenter;
    Lab2.backgroundColor = ClearColor;
    [aView addSubview:Lab2];
*/
    
    UIView * stuLine = [[UIView new]autorelease];
    stuLine.frame = CGRectMake(80, 8, 1, 28);
    stuLine.backgroundColor = [UIColor grayColor];
    [aView addSubview:stuLine];
    UIView * stuLine2 = [[UIView new]autorelease];
    stuLine2.frame = CGRectMake(81, 9, 1, 28);
    stuLine2.backgroundColor = [UIColor whiteColor];
    [aView addSubview:stuLine2];
    
    UIButton * Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn2.frame = CGRectMake(82, 0, 70, 45);
    Btn2.titleLabel.font = GirlFonts16;
    [Btn2 setTitle:@"评论:0" forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [Btn2 setTitleColor:SysColor forState:UIControlStateHighlighted];
    [Btn2 setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Btn2.titleLabel.shadowOffset = CGSizeMake(1, 1);
    [aView addSubview:Btn2];
    //NSLog(@"%d",self.aBlog.commentscount);//我一样情难以堪
    //2013-03-17 13:21:33.325 Weibo_WJC[3136:c07] 135502720
    /*
    UILabel * Lab3 = [[UILabel new]autorelease];
    Lab3.frame = CGRectMake(82, 0, 40, 45);
    Lab3.text = @"评论:";
    Lab3.font = GirlFonts16;
    Lab3.backgroundColor = ClearColor;
    [aView addSubview:Lab3];
    
    UILabel * Lab4 = [[UILabel new]autorelease];
    Lab4.frame = CGRectMake(120, 0, 30, 45);
    Lab4.text = @"35";
    Lab4.textAlignment = NSTextAlignmentCenter;
    Lab4.backgroundColor = ClearColor;
    [aView addSubview:Lab4];
*/
    
    
//    UIImageView * 
    
    UIImageView * bottomLine = [[UIImageView new]autorelease];
    bottomLine.frame = CGRectMake(5, 42, 310, 2);
    bottomLine.image = bottomLineImg;
    [aView addSubview:bottomLine];
    
    return aView;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end