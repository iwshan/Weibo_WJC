//
//  L_LookForFriendViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_LookForFriendViewController.h"

@interface L_LookForFriendViewController ()

@end

@implementation L_LookForFriendViewController

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
        
        self.isHidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIView * customTab = [[UIView new]autorelease];
    customTab.frame = CGRectMake(0, 0, 320, 44);
    customTab.backgroundColor = SysColor;
    customTab.layer.shadowColor = [UIColor blackColor].CGColor;
    customTab.layer.shadowOffset = CGSizeMake(0, 3);
    customTab.layer.shadowOpacity = 0.4;
    
    /*
    UIImage * mentionImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_mentions" ofType:@"png"]];
    UIImage * commentImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_comments" ofType:@"png"]];
    UIImage * messageImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_messages" ofType:@"png"]];
    UIImage * noticeImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_notice" ofType:@"png"]];
    
    NSArray * imgArr = [NSArray arrayWithObjects:mentionImg,commentImg,messageImg,noticeImg, nil];
    
    */
    
    UIButton * Btn;
    for (int i = 0 ; i<5; i++) {
        Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn.showsTouchWhenHighlighted = YES;
        Btn.frame = CGRectMake(50+(44*i), 0, 44, 44);
        Btn.tag = i;
        [Btn addTarget:self action:@selector(showDifrentView:) forControlEvents:UIControlEventTouchUpInside];
//        [Btn setImage:[imgArr objectAtIndex:i] forState:UIControlStateNormal];
        [Btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [customTab addSubview:Btn];
    }
    
    UIView * floatLine = [[UIView new]autorelease];
    floatLine.frame = CGRectMake(0, 0, 30, 3);
    floatLine.center = CGPointMake(70, 39);
    floatLine.backgroundColor = [UIColor whiteColor];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"moveFloatLine" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        UIButton * aBtn = (UIButton *)note.object;
        
        [UIView animateWithDuration:0.35 animations:^{
            floatLine.center = CGPointMake(70+(44*aBtn.tag), 39);
        }];
        
    }];
    
    [customTab addSubview:floatLine];
    
    self.contentView.frame = CGRectMake(0, 44, 320, [UIScreen mainScreen].bounds.size.height - 104);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:customTab];
    
    /*
    T_Mention_TableVC * mentionVC = [[T_Mention_TableVC new]autorelease];
    mentionVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:mentionVC];
    
    T_Comment_TableVC * commentVC = [[T_Comment_TableVC new]autorelease];
    commentVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:commentVC];
    
    T_Messages_TableVC * messageVC = [[T_Messages_TableVC new]autorelease];
    messageVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:messageVC];
    
        t_no * messageVC = [[T_Messages_TableVC new]autorelease];
        messageVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
        [self.Controllers addObject:messageVC];
    
    self.currVC = [self.Controllers objectAtIndex:currIndex];
    [self.contentView addSubview:self.currVC.view];
    
    */
    
    L_WaveViewController * waveVC = [[[L_WaveViewController alloc]init]autorelease];
    waveVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:waveVC];
    
    L_AddressBookViewController * addressBookVC = [[[L_AddressBookViewController alloc]init]autorelease];
    addressBookVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:addressBookVC];
    
    L_AroundKnowViewController * aroundKnowVC = [[[L_AroundKnowViewController alloc]init]autorelease];
    aroundKnowVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:aroundKnowVC];
    
    L_GuessKnowViewController * guessKnowVC = [[[L_GuessKnowViewController alloc]init]autorelease];
    guessKnowVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:guessKnowVC];
    
    L_QrCodeViewController * qrCodeVC = [[[L_QrCodeViewController alloc]init]autorelease];
    qrCodeVC.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 104);
    [self.Controllers addObject:qrCodeVC];
    
    //
    self.currVC = [self.Controllers objectAtIndex:currIndex];
    [self.contentView addSubview:self.currVC.view];
    
    //
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5, 10, 44, 24);
    backBtn.showsTouchWhenHighlighted = YES;
    [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_highlighted"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(actionBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [customTab addSubview:backBtn];
    
    //
    UIButton * hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hiddenButton.backgroundColor = [UIColor clearColor];
    hiddenButton.frame = CGRectMake(320-44, 0, 44, 44);
    [hiddenButton setTitle:@"隐身" forState:UIControlStateNormal];
    [hiddenButton addTarget:self
                     action:@selector(actionHiddenButton:)
           forControlEvents:UIControlEventTouchUpInside];
    if (!self.isHidden)
    {
        [customTab addSubview:hiddenButton];
    }
    
}

-(void)showDifrentView:(UIButton *)sender{
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"moveFloatLine" object:sender];
    //    NSLog(@"%@",self.currVC.view);
//    [self.currVC.view removeFromSuperview];
//    self.currVC = [self.Controllers objectAtIndex:sender.tag];
//    [self.contentView addSubview:self.currVC.view];
    [self.currVC.view removeFromSuperview];
    self.currVC = [self.Controllers objectAtIndex:sender.tag];
    [self.contentView addSubview:self.currVC.view];
    
}

#pragma mark ----ActionButton:

-(void)actionBackButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)actionHiddenButton:(UIButton *)sender
{
    
    
}

@end
