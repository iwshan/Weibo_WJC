//
//  T_Comment_TableVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Comment_TableVC.h"
#import "ToMe.h"

@interface T_Comment_TableVC ()

@end

@implementation T_Comment_TableVC

@synthesize dataSourc;

-(void)dealloc{
    self.dataSourc = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad//--------------------问题 程序载入时自动执行下载 不合理 请求方法写在willapear里既不走 又更不合理呀
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = ClearColor;
    self.tableView.backgroundColor = GrayBG;
    
    // 请求数据demo
    T_Loading_View * aLoading = [[T_Loading_View new]autorelease];
    [self.view addSubview:aLoading];
    
    SystemCenter * sysSina = [SystemCenter getInstance];
    NSMutableDictionary * d = [NSMutableDictionary dictionaryWithCapacity:0];
    [d setValue:@"10" forKey:@"count"];
    SinaWeiboRequest * request = [sysSina.SysSina requestWithURL:@"comments/to_me.json" params:d httpMethod:@"GET" delegate:nil];
    [request setFinishBlock:^(NSMutableArray *arrData) {
        self.dataSourc = arrData;
        [self.tableView reloadData];
        
        [self.view bringSubviewToFront:aLoading];
        [aLoading finishLoading];
        
//        for (NSObject * obj in self.dataSourc) {
//            ToMe * ablog = (ToMe *)obj;
//            NSLog(@"%@",ablog.text);
//        }
        
    }];
    
    [request setFailBlock:^(SinaWeiboRequest *request, NSError * error) {
        NSLog(@"error = %@",[error localizedDescription]);
    }];
    [request connect];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
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
    return self.dataSourc.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    T_Main_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[T_Main_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    
    Microblog * aBlog = [self.dataSourc objectAtIndex:indexPath.row];
    cell.blog = aBlog;
    
    [cell setInfo];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    T_Main_Cell * cell = (T_Main_Cell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
