//
//  T_Person_HomeTVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-18.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Person_HomeTVC.h"

@interface T_Person_HomeTVC ()

@end

@implementation T_Person_HomeTVC

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
    
    self.view.backgroundColor = GrayBG;
    self.title = @"个人主页";
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 24);
    backBtn.showsTouchWhenHighlighted = YES;
    [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[[UIBarButtonItem alloc]initWithCustomView:backBtn]autorelease];
    self.navigationItem.leftBarButtonItem = backItem;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * aView = [[UIView new]autorelease];
    aView.frame = CGRectMake(0, 0, screenWidth, 160);
    aView.backgroundColor = [UIColor redColor];
    
    UIImage * bgImg = [UIImage imageNamed:@"sky_background"];
    UIImageView * backView = [[[UIImageView alloc]initWithImage:bgImg]autorelease];
    backView.frame = CGRectMake(0, -160, 320, 260);
    [aView addSubview:backView];
    
    UIImageView * userIcon = [[UIImageView new]autorelease];
    userIcon.frame = CGRectMake(10, 10, 80, 80);
    //userIcon.center = CGPointMake(80, 50);
    userIcon.layer.shadowColor = [UIColor blackColor].CGColor;
    userIcon.layer.shadowOffset = CGSizeMake(1, 1);
    userIcon.layer.shadowOpacity = 0.4;
    userIcon.layer.shadowRadius = 2;
    userIcon.layer.cornerRadius = 5;
    userIcon.backgroundColor = [UIColor greenColor];
    [aView addSubview:userIcon];
    
    UILabel * nameLab = [[UILabel new]autorelease];
    nameLab.frame = CGRectMake(110, 15, 190, 26);
    nameLab.font = GirlFonts14;
    //nameLab.textColor = SysColor;
    nameLab.shadowColor = [UIColor whiteColor];
    nameLab.shadowOffset = CGSizeMake(1, 1);
    nameLab.backgroundColor = ClearColor;
    nameLab.text = @"斤斤计较";
    [aView addSubview:nameLab];
    
    UIButton * LookedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    LookedBtn.frame = CGRectMake( 200, 50, 100, 30);
    //userinfo_relationship
    LookedBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    LookedBtn.layer.shadowOffset = CGSizeMake(1, 1);
    LookedBtn.layer.shadowOpacity = 0.4;
    LookedBtn.layer.shadowRadius = 2;
    LookedBtn.layer.cornerRadius = 5;
    LookedBtn.backgroundColor = [UIColor colorWithRed:0.2 green:1 blue:100/255.0 alpha:1];
    [LookedBtn setTitle:@"加关注" forState:UIControlStateNormal];
    LookedBtn.titleLabel.font = GirlFonts16;
    /*
     */
    [LookedBtn setTintColor:[UIColor greenColor]];
    [aView addSubview:LookedBtn];
    
    UIView * bottomView = [[UIView new]autorelease];
    bottomView.frame = CGRectMake(0, 100, 320, 60);
    bottomView.backgroundColor = GrayBG;
    bottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    bottomView.layer.shadowOffset = CGSizeMake(0, 0);
    bottomView.layer.shadowOpacity = 0.4;
    bottomView.layer.shadowRadius = 2;
    [aView addSubview:bottomView];
    
    NSArray * btnDataArr = [NSArray arrayWithObjects:@"详细\n资料",@"userDetail",@"关注",@"forcus",@"粉丝",@"friends",@"赞",@"good", nil];
    
    for (int i = 0; i<4; i++) {
        UIButton * Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn.frame = CGRectMake( 10 + 77*i, 5, 70, 50);
        Btn.layer.shadowColor = [UIColor blackColor].CGColor;
        Btn.layer.shadowOffset = CGSizeMake(1, 1);
        Btn.layer.shadowOpacity = 0.4;
        Btn.layer.shadowRadius = 2;
        Btn.layer.cornerRadius = 5;
        Btn.backgroundColor = GrayBG;
        
//        Btn.layer.borderColor = GrayBG.CGColor;
//        Btn.layer.borderWidth = 1;
        
        [Btn setTintColor:[UIColor grayColor]];
        [Btn setTitle:[btnDataArr objectAtIndex:i*2] forState:UIControlStateNormal];
        [Btn setTitleColor:SysColor forState:UIControlStateNormal];
        [Btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [Btn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [Btn setTitleShadowColor:SysColor forState:UIControlStateHighlighted];

        Btn.titleLabel.font = GirlFonts16;
        Btn.titleLabel.shadowOffset = CGSizeMake(1, 1);
        Btn.titleLabel.numberOfLines = 2;
        Btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        NSLog(@"%@",[btnDataArr objectAtIndex:i*2]);
//        NSLog(@"%d",i*2);
        [bottomView addSubview:Btn];
    }
    
    
    
    return aView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
