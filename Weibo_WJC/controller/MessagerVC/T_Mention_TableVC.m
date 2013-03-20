//
//  T_Mention_TableVCViewController.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Mention_TableVC.h"

@interface T_Mention_TableVC ()

@end

@implementation T_Mention_TableVC

@synthesize dataSourc;

-(void)dealloc{
    self.dataSourc = nil;
    
    /**/
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    
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
    SinaWeiboRequest * request = [sysSina.SysSina requestWithURL:@"statuses/mentions.json" params:d httpMethod:@"GET" delegate:nil];
    [request setFinishBlock:^(NSMutableArray *arrData) {
        self.dataSourc = arrData;
        [self.tableView reloadData];
        
        [self.view bringSubviewToFront:aLoading];
        [aLoading finishLoading];
        
//        for (NSObject * obj in self.dataSourc) {
//            Microblog * ablog = (Microblog *)obj;
//            NSLog(@"%@",ablog.text);
//        }
        
    }];
    
    [request setFailBlock:^(SinaWeiboRequest *request, NSError * error) {
        NSLog(@"error = %@",[error localizedDescription]);
    }];
    
    [request connect];
    /*
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"ShowBigImg" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        NSArray * aArr = (NSArray *)note.object;
        //因为下载地址有误 可能没有 这里做了个调试打印
        //NSLog(@"%d",aArr.count);
        //NSLog(@"%@",aArr);
        UIImageView * imgView = [aArr objectAtIndex:0];
        T_Show_ImgVC * aImgView = [[T_Show_ImgVC new]autorelease];
        
        //这里是洒家智慧的结晶 通知相应就用传过来的信息 然后启动下载类 下载图片 使用 哈哈
        [self presentViewController:aImgView animated:YES completion:^{
            DownLoad * down = [[DownLoad new]autorelease];
            
            aImgView.currntImg.image = imgView.image;
            
            if (aArr.count>1) {
                
                if ([aArr objectAtIndex:2]) {
                    down.urlStr = [aArr objectAtIndex:2];
                }else if([aArr objectAtIndex:1]){
                    down.urlStr = [aArr objectAtIndex:1];
                }
                
                if (down.urlStr) {
                    [down setfinish:^(UIImage *Img) {
                        aImgView.currntImg.image = Img;
                        aImgView.currntImg.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
                    }];
                    [down download];
                }
                
            }
        }];
    }];
     */
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
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    //[self.navigationController pushViewController:detailVC animated:YES];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"pushController" object:[dataSourc objectAtIndex:indexPath.row]];

    //NSLog(@"%@",[[[self.view superview] nextResponder] nextResponder]);
    //self.view 父级view 的 controller 的 navigationcontroller 推一个页面  隐藏一个view
    
}

@end
