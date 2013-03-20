//
//  T_WrtWeibo_VC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_WrtWeibo_VC.h"

@interface T_WrtWeibo_VC ()

@end

@implementation T_WrtWeibo_VC

-(void)dealloc{
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isFace = NO;
        sysSetting = [T_System_Setting shareSystemInfo];
        if (!sysSetting.facial) {
            NSDictionary * faceDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotionImage" ofType:@"plist"]];
            
            sysSetting.facial = [faceDic keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                if ([obj1 intValue]<[obj2 intValue]) {
                    return NSOrderedAscending;
                }
                if ([obj1 intValue]>[obj2 intValue]) {
                    return NSOrderedDescending;
                }
                return NSOrderedSame;
            }];

        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * topView = [[UIView new]autorelease];
    topView.frame = CGRectMake(0, 0, 320, 44);
    topView.backgroundColor = SysColor;
    topView.layer.shadowColor = [UIColor blackColor].CGColor;
    topView.layer.shadowOffset = CGSizeMake(0, 3);
    topView.layer.shadowOpacity = 0.4;
    
    T_Sys_Btn * sendeMeg = [T_Sys_Btn buttonWithType:UIButtonTypeCustom];
    sendeMeg.frame = CGRectMake(10, 7, 60, 30);
    [sendeMeg setTitle:@"发送" forState:UIControlStateNormal];
    [topView addSubview:sendeMeg];
    
    T_Sys_Btn * quitBtn = [[[T_Sys_Btn alloc]initWithFrame:CGRectMake(250, 7, 60, 30)]autorelease];
    [quitBtn setTitle:@"取消" forState:UIControlStateNormal];
    [quitBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:quitBtn];
    
    UILabel * titleLab = [[UILabel new]autorelease];
    titleLab.backgroundColor = ClearColor;
    titleLab.frame = CGRectMake(0, 0, 200, 30);
    titleLab.center = CGPointMake(160, 22);
    titleLab.text = @"Amor-NIM-Trillion";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont fontWithName:@"Helvetica" size:18];
    titleLab.textColor = [UIColor whiteColor];
    [topView addSubview:titleLab];
    
    [self.view addSubview:topView];
    
    WrtField = [[UITextView new]autorelease];
    WrtField.frame = CGRectMake(0, 44, 320, 200);
    WrtField.font = GirlFonts16;
//    WrtField.backgroundColor = [UIColor redColor];
    [WrtField becomeFirstResponder];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:@"printFace" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        UIButton * btn = (UIButton *)note.object;
        //以上是得到发送信息的控件 是个button 方便以后使用
        //下面是一个试值打印
//        NSLog(@"%s::::%@",__func__,[sysSetting.facial objectAtIndex:(btn.tag-1)]);
        WrtField.text = [WrtField.text stringByAppendingString:[sysSetting.facial objectAtIndex:(btn.tag-1)]];
    }];
    
    [self.view addSubview:WrtField];
    
    UIView * barView = [[UIView new]autorelease];
    barView.frame = CGRectMake(0, 0, 320, 40);
    barView.backgroundColor = [UIColor colorWithRed:([[sysSetting.setColor valueForKey:@"redVal"] intValue]+220)/256.0 green:([[sysSetting.setColor valueForKey:@"greenVal"] intValue]+170)/256.0 blue:([[sysSetting.setColor valueForKey:@"blueVal"] intValue]+180)/256.0 alpha:1];
   
    barView.layer.shadowColor = SysColor.CGColor;
    barView.layer.shadowOffset = CGSizeMake(0, -2);
    barView.layer.shadowOpacity = 0.4;
    
    
    UIImage * emoticonImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emoticonbutton_background" ofType:@"png"]];
    UIImage * trendImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trendbutton_background" ofType:@"png"]];
    UIImage * mentionImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mentionbutton_background" ofType:@"png"]];
    UIImage * cameraImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"camerabutton_background" ofType:@"png"]];
    
    NSArray * btnImgs = [NSArray arrayWithObjects:cameraImg,trendImg,mentionImg,emoticonImg, nil];
    
    UIButton * inputBtn;
    for (int i = 0; i<4; i++) {
        inputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        inputBtn.frame = CGRectMake(40+(60*i), 0, 60, 40);
        [barView addSubview:inputBtn];
//        [inputBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [inputBtn setImage:[btnImgs objectAtIndex:i] forState:UIControlStateNormal];
        inputBtn.showsTouchWhenHighlighted = YES;
        inputBtn.tag = i;
        NSString * selName = [NSString stringWithFormat:@"keyboardAction%d:",i];
        SEL aSelect = NSSelectorFromString(selName);
        [inputBtn addTarget:self action:aSelect forControlEvents:UIControlEventTouchUpInside];
    }
    WrtField.inputAccessoryView = barView;
    [self.view bringSubviewToFront:topView];
}

-(void)dismissSelf{
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

-(void)keyboardAction0:(UIButton *)sender{
    NSLog(@"%d",sender.tag);
}

-(void)keyboardAction1:(UIButton *)sender{
    NSLog(@"%d",sender.tag);
}

-(void)keyboardAction2:(UIButton *)sender{
    NSLog(@"%d",sender.tag);
}

-(void)keyboardAction3:(UIButton *)sender{
    if (isFace == NO) {
        isFace = YES;
        TFacekeyboard * Facekeyboard = [[TFacekeyboard new]autorelease];
        WrtField.inputView = Facekeyboard;
        UIImage * keyboardImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"keyboardbutton_background" ofType:@"png"]];
        [sender setImage:keyboardImg forState:UIControlStateNormal];
    }else if(isFace == YES){
        isFace = NO;
        WrtField.inputView = nil;
        UIImage * emoticonImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emoticonbutton_background" ofType:@"png"]];
        [sender setImage:emoticonImg forState:UIControlStateNormal];
    }
    
    [WrtField reloadInputViews];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
