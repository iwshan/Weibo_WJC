//
//  HomeMainVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "HomeMainVC.h"
#import "ToMe.h"

@interface HomeMainVC ()

@end

@implementation HomeMainVC

/*
 精华错误收藏
 Local declaration of 'tableview' hides instance variable
 将下面代码
 @synthesize tableView;
 改成
 @synthesize tableView=_tableView;
 不知道错误发生再哪里 但是感觉神奇
 */

@synthesize dataSourc , tableView=_tableView;

-(void)dealloc{
    self.tableView = nil;
    self.dataSourc = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
//        self.dataSourc = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tstdata" ofType:@"plist"]];
        self.tableView = [[UITableView new]autorelease];
    }
    return self;
}

//-(void)viewDidAppear:(BOOL)animated{
//    NSLog(@"%@",self.view);
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Amor-NIM-Trillion";
    
    T_Sys_Btn * writeBtn = [T_Sys_Btn buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, 60, 30);
    [writeBtn setTitle:@"写微博" forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * wrtItem = [[[UIBarButtonItem alloc]initWithCustomView:writeBtn] autorelease];
    self.navigationItem.leftBarButtonItem = wrtItem;
    
    //现在有个tableview了 怎样叫他刷新吧
    self.tableView.backgroundColor = GrayBG;
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    self.tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    T_Loading_View * aLoading = [[T_Loading_View new]autorelease];
    [self.view addSubview:aLoading];
    
    // 请求数据demo
    SystemCenter * sysSina = [SystemCenter getInstance];
    NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:0];
    [d setValue:@"20" forKey:@"count"];
    
    SinaWeiboRequest * request = [sysSina.SysSina requestWithURL:@"statuses/friends_timeline.json" params:d httpMethod:@"GET" delegate:nil];
    [request setFinishBlock:^(NSMutableArray *arrData) {
        self.dataSourc = arrData;
        [self.tableView reloadData];
        
        [self.view bringSubviewToFront:aLoading];
        [aLoading finishLoading];
        /*
         [arrData retain];
         for (NSObject * obj in self.dataSourc) {
         Microblog * ablog = (Microblog *)obj;
         NSLog(@"%d",ablog.type);
         }
         Microblog
         */
        
    }];
    
    [request setFailBlock:^(SinaWeiboRequest *request, NSError * error) {
        NSLog(@"error = %@",[error localizedDescription]);
    }];
    [request connect];

}

-(void)present{
    T_WrtWeibo_VC * preVC = [[T_WrtWeibo_VC new]autorelease];
    [self presentViewController:preVC animated:YES completion:^{
        ;
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取cell时遇到问题 问问吧]
    T_Main_Cell * cell = (T_Main_Cell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourc.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Microblog * aBlog = [self.dataSourc objectAtIndex:indexPath.row];

    NSString * cellIdentify = @"Cell";
    T_Main_Cell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[[T_Main_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify]autorelease];
    }
    cell.blog = aBlog;
    [cell setInfo];
    
    
    UITapGestureRecognizer * showPersonHome = [[UITapGestureRecognizer new]autorelease];
    [showPersonHome addTarget:self action:@selector(showPersonHome)];
    [cell.userIcon addGestureRecognizer:showPersonHome];
    
    return cell;

}

// TODO: 显示个人页面

-(void)showPersonHome{
    T_Person_HomeTVC * personHome = [[T_Person_HomeTVC new]autorelease];
    [self.navigationController pushViewController:personHome animated:YES];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    T_blogDetail_TableVC * detailVC = [[[T_blogDetail_TableVC alloc] initWithStyle:UITableViewStylePlain]autorelease];
    detailVC.aBlog = [dataSourc objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
//    T_Main_Cell * cell = (T_Main_Cell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    // 请求数据demo
//    T_Loading_View * aLoading = [[T_Loading_View new]autorelease];
//    [self.view addSubview:aLoading];
//    
//    SystemCenter * sysSina = [SystemCenter getInstance];
//    NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:10];
//    NSLog(@"%@",cell.blog.Id);
////    [d setValue:cell.blog.Id forKey:@"id"];
//    [d setValue:[NSString stringWithFormat:@"%@",cell.blog.Id]  forKey:@"id"];
//    SinaWeiboRequest * request = [sysSina.SysSina requestWithURL:@"place/nearby_users/list.json" params:d httpMethod:@"GET" delegate:nil];
//    [request setFinishBlock:^(NSMutableArray *arrData) {
//        self.dataSourc = arrData;
//        [self.tableView reloadData];
//        
//        [self.view bringSubviewToFront:aLoading];
//        [aLoading finishLoading];
//        
//        for (NSObject * obj in self.dataSourc) {
//            ToMe * ablog = (ToMe *)obj;
//            NSLog(@"%@",ablog.text);
//        }
//        
//    }];
//    
//    [request setFailBlock:^(SinaWeiboRequest *request, NSError * error) {
//        NSLog(@"error = %@",[error localizedDescription]);
//    }];
//    [request connect];
    
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
//}

@end
