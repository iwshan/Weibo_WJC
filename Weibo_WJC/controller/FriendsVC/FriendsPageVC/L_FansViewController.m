//
//  L_FansViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_FansViewController.h"

@interface L_FansViewController ()

@end

@implementation L_FansViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
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
    T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navView setBackgroundColor:SysColor];
    navView.layer.shadowColor = [UIColor blackColor].CGColor;
    navView.layer.shadowOffset = CGSizeMake(0, 3);
    navView.layer.shadowOpacity = 0.4;
    [self.view addSubview:navView];
    [navView release];
    //
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.center = navView.center;
    titleLabel.text = @"粉丝";
    titleLabel.font = [UIFont fontWithName:@"Arial" size:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
    [titleLabel release];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
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
    
    //
    self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 460-44-40)
                                                 style:UITableViewStylePlain]autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    

    
    /*
    CGSize size7 = CGSizeMake(0, 0); ／／初始化size7
    NSString *label7String = [labelDic objectForKey:@"v7"];  ／／获取数据
    CGSize titleSize = [label7String sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)]; ／／获取字符串的实际大小
    size7 = titleSize;／／保存字符串的大小（也就是label的大小）用来指定相邻的label8的位置
    
    UILabel *label7 = [[UILabel alloc] init];
    label7.frame = CGRectMake(17, 63, titleSize.width, titleSize.height);／／初始化label7
    */
    
    
}

#pragma mark -----UITableViewDataSource-----

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier]autorelease];
    }
    
    
    return cell;
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

#pragma mark ----actionBackButton:
-(void)actionBackButton:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)actionHomeButton:(UIButton *)sender
{


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
