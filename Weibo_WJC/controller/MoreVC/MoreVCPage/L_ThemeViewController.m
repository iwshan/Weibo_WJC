//
//  L_ThemeViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-15.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_ThemeViewController.h"

@interface L_ThemeViewController ()

@end

@implementation L_ThemeViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        sysSetting = [T_System_Setting shareSystemInfo];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = GrayBG;
    self.title = @"我的主题";
    
    T_Sys_Btn * queryBtn = [[[T_Sys_Btn alloc]initWithFrame:CGRectMake(250, 7, 60, 30)]autorelease];
    [queryBtn setTitle:@"确认" forState:UIControlStateNormal];
    [queryBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * queryItem = [[[UIBarButtonItem alloc]initWithCustomView:queryBtn]autorelease];
    self.navigationItem.leftBarButtonItem = queryItem;
    
    T_Sys_Btn * normalBtn = [[[T_Sys_Btn alloc]initWithFrame:CGRectMake(250, 7, 60, 30)]autorelease];
    [normalBtn setTitle:@"默认" forState:UIControlStateNormal];
    [normalBtn addTarget:self action:@selector(normalSet) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * normalItem = [[[UIBarButtonItem alloc]initWithCustomView:normalBtn]autorelease];
    self.navigationItem.rightBarButtonItem = normalItem;
    
    themeImg = [[UIImageView new]autorelease];
    themeImg.frame = CGRectMake(0, 0, 240, 345);
    themeImg.backgroundColor = SysColor;
    themeImg.center = CGPointMake(screenWidth/2, 180);
    themeImg.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"them_bg" ofType:@"png"]];
    themeImg.layer.cornerRadius = 5;
    themeImg.layer.shadowColor = [UIColor grayColor].CGColor;
    themeImg.layer.shadowOffset = CGSizeMake(2, 2);
    themeImg.layer.shadowOpacity = 0.7;
    themeImg.layer.shadowRadius = 6;
    
    [self.view addSubview:themeImg];
    
    
    UISlider * slider = [[[UISlider alloc]initWithFrame:CGRectMake(30, 350, 257, 30)]autorelease];
    //colorSlider.png
    slider.minimumValue = 0;
    slider.maximumValue = 60;
    [slider setMinimumValueImage:[UIImage imageNamed:@"colorSlider"]];
    [slider setMaximumValueImage:[UIImage imageNamed:@"colorSlider"]];
    [slider addTarget:self
               action:@selector(actionSlider:)
     forControlEvents:UIControlEventValueChanged];
    slider.continuous = YES;
    //    slider.value = 50;
    //    [slider setValue:600 animated:YES];
    [self.view addSubview:slider];
    
    //
//    self.label = [[[UILabel alloc]initWithFrame:CGRectMake(100, 250, 100, 50)]autorelease];
//    self.label.text = @"1";
//    self.label.backgroundColor = [UIColor yellowColor];
//    
//    [self.view addSubview:self.label];
    
    
}

-(void)actionSlider:(UISlider *)sender
{
//    NSLog(@"%s",__func__);
    self.value = [NSString stringWithFormat:@"%f",sender.value];
    
//    self.label.text = self.value;
    
    if (sender.value <= 10&&sender.value >= 0)
    {
        self.rInt = 255;
        self.gInt = 255*(sender.value/10.0);
        self.bInt = 0;
    }
    else if (sender.value <= 20)
    {
        self.rInt = 255 - 255*(sender.value - 10)/10.0;
        self.gInt = 255;
        self.bInt = 0;
        
    }
    else if (sender.value <= 30)
    {
        self.rInt = 0;
        self.gInt = 255;
        self.bInt = 255*(sender.value - 20)/10.0;
        
    }
    else if (sender.value <= 40)
    {
        self.rInt = 0;
        self.gInt = 255- 255*(sender.value - 30)/10.0;
        self.bInt = 255;
        
    }
    else if (sender.value <= 50)
    {
        self.rInt = 255*(sender.value - 40)/10.0;
        self.gInt = 0;
        self.bInt = 255;
        
    }
    else if (sender.value <= 60)
    {
        self.rInt = 255;
        self.gInt = 0;
        self.bInt = 255 - 255*(sender.value - 50)/10.0;
        
    }
    
    NSLog(@"r = %f\n g = %f\n b = %f",self.rInt,self.gInt,self.bInt);
   
    themeImg.backgroundColor = [UIColor colorWithRed:(self.rInt/255.0) green:(self.gInt/255.0) blue:(self.bInt/255.0) alpha:1];
    
}

/*此方法能用来设置系统颜色 此处留有备份 以便使用
 */

 -(void)popBack{
     
     [self.navigationController popViewControllerAnimated:YES];
     
     NSString * file = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
     file = [file stringByAppendingString:@"System Info.plist"];
     
     NSDictionary * aC = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSString stringWithFormat:@"%f",self.rInt],@"redVal",
                          [NSString stringWithFormat:@"%f",self.bInt],@"blueVal",
                          [NSString stringWithFormat:@"%f",self.gInt],@"greenVal",
                          nil];
     
     NSMutableDictionary * aDic = [NSMutableDictionary dictionaryWithContentsOfFile:file];
     [aDic setObject:aC forKey:@"color"];
     [aDic writeToFile:file atomically:YES];
//     NSLog(@"%@",aDic);
//     sysSetting.setColor = aC;
}

-(void)normalSet{
    NSLog(@"normalSet!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
