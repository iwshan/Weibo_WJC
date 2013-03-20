//
//  MessagerMainVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "MessagerMainVC.h"

@interface MessagerMainVC ()

@end

@implementation MessagerMainVC

@synthesize Controllers , selected , currVC , contentView;

-(void)dealloc{
    self.Controllers = nil;
    self.currVC = nil;
    self.contentView = nil;
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currIndex = 0;
        self.selected = 0;
        sysSetting = [T_System_Setting shareSystemInfo];
        self.contentView = [[UIView new]autorelease];
        self.Controllers = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentView.frame = CGRectMake(0, 44, 320, [UIScreen mainScreen].bounds.size.height - 104);
    self.contentView.backgroundColor = [UIColor whiteColor];

    self.navigationController.navigationBar.hidden = YES;
    
    customTab = [[UIView new]autorelease];
    customTab.frame = CGRectMake(0, 0, 320, 44);
    customTab.backgroundColor = SysColor;
    customTab.layer.shadowColor = [UIColor blackColor].CGColor;
    customTab.layer.shadowOffset = CGSizeMake(0, 3);
    customTab.layer.shadowOpacity = 0.4;
    
    UIImage * mentionImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_mentions" ofType:@"png"]];
    UIImage * commentImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_comments" ofType:@"png"]];
    UIImage * messageImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_messages" ofType:@"png"]];
    UIImage * noticeImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_notice" ofType:@"png"]];
    
    NSArray * imgArr = [NSArray arrayWithObjects:mentionImg,commentImg,messageImg,noticeImg, nil];
    
    UIButton * Btn;
    for (int i = 0 ; i<4; i++) {
        Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn.showsTouchWhenHighlighted = YES;
        Btn.frame = CGRectMake(50+(55*i), 0, 55, 44);
        Btn.tag = i;
        [Btn addTarget:self action:@selector(showDifrentView:) forControlEvents:UIControlEventTouchUpInside];
        [Btn setImage:[imgArr objectAtIndex:i] forState:UIControlStateNormal];
        [customTab addSubview:Btn];
    }
    
    UIView * floatLine = [[UIView new]autorelease];
    floatLine.frame = CGRectMake(0, 0, 30, 2);
    floatLine.center = CGPointMake(78, 39);
    floatLine.backgroundColor = [UIColor whiteColor];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"moveFloatLine" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        UIButton * aBtn = (UIButton *)note.object;
        [UIView animateWithDuration:0.35 animations:^{
            floatLine.center = CGPointMake(77.5+(55*aBtn.tag), 39);
        }];
        
    }];
    
    [customTab addSubview:floatLine];    
    [self.view addSubview:customTab];

    
    T_Mention_TableVC * mentionVC = [[T_Mention_TableVC new]autorelease];
    mentionVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
//    MessagerNav * mentionNav = [[[MessagerNav alloc]initWithRootViewController:mentionVC]autorelease];
    [self.Controllers addObject:mentionVC];
    
    T_Comment_TableVC * commentVC = [[T_Comment_TableVC new]autorelease];
    commentVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
//    MessagerNav * commentNav = [[[MessagerNav alloc]initWithRootViewController:commentVC]autorelease];
    [self.Controllers addObject:commentVC];
    
    T_Messages_TableVC * messageVC = [[T_Messages_TableVC new]autorelease];
    messageVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
//    MessagerNav * messageNav = [[[MessagerNav alloc]initWithRootViewController:messageVC]autorelease];
    [self.Controllers addObject:messageVC];
   
    T_Notice_TableVC * noticeVC = [[T_Notice_TableVC new]autorelease];
    noticeVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:noticeVC];
    
    self.currVC = [self.Controllers objectAtIndex:currIndex];
    [self.contentView addSubview:self.currVC.view];
    NSLog(@"%@",self.currVC);
    
    [self.view addSubview:self.contentView];
    
    [center addObserverForName:@"pushController" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        T_blogDetail_TableVC * detailVC = [[[T_blogDetail_TableVC alloc] initWithStyle:UITableViewStylePlain]autorelease];
        detailVC.aBlog = note.object;
        //NSLog(@"%@",detailVC.aBlog);
        [self.navigationController pushViewController:detailVC animated:YES];
        self.navigationController.navigationBarHidden = NO;
        customTab.hidden = YES;
    }];
    
    [self.view bringSubviewToFront:customTab];
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    customTab.hidden = NO;
}

-(void)showDifrentView:(UIButton *)sender{

    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"moveFloatLine" object:sender];

    //NSLog(@"%@",self.currVC.view);
    [self.currVC.view removeFromSuperview];
    self.currVC = [self.Controllers objectAtIndex:sender.tag];
    [self.contentView addSubview:self.currVC.view];
}

@end
