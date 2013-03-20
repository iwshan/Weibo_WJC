//
//  TMainViewController.m
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-1.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TMainViewController.h"


@interface TMainViewController ()

@end

@implementation TMainViewController

@synthesize Controllers , selected , currVC , currNav , contentView;

-(void)dealloc{
    self.contentView = nil;
    self.currVC = nil;
    self.currNav = nil;
    self.Controllers = nil;
    
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
        self.Controllers = [[NSMutableArray new] autorelease];
        self.contentView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60)]autorelease];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sysSetting = [T_System_Setting shareSystemInfo];
    [self.view addSubview:self.contentView];
    UIImageView * bgImg = [[UIImageView new]autorelease];
    bgImg.backgroundColor = SysColor;
    bgImg.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    bgImg.image = [UIImage imageNamed:@"square_bg"];
    [self.contentView addSubview:bgImg];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView * tabBarView = [[UIView new]autorelease];
    tabBarView.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, 320, 40);
    
    tabBarView.backgroundColor = SysColor;
    
    UIImage * homeImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home" ofType:@"png"]];
    UIImage * messagImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages" ofType:@"png"]];
    UIImage * profileImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"profile" ofType:@"png"]];
    UIImage * discoverImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"discover" ofType:@"png"]];
    UIImage * moreImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more" ofType:@"png"]];
    NSArray * btnImgArr = [NSArray arrayWithObjects:homeImg,messagImg,profileImg,discoverImg,moreImg, nil];
    
    UIButton * aBtn;
    for (int i = 0; i<5; i++) {
        aBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        aBtn.showsTouchWhenHighlighted = YES;
        aBtn.frame = CGRectMake(64*i, 0, 64, 40);
        [aBtn setImage:[btnImgArr objectAtIndex:i] forState:UIControlStateNormal];
        aBtn.tag = i;
        [aBtn addTarget:self action:@selector(TabBarButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarView addSubview:aBtn];
    }
    
    //底部按钮的浮动块 
    UIView * floatBlock = [[UIView new]autorelease];
    floatBlock.frame = CGRectMake(0, 0, 44, 30);
    floatBlock.center = CGPointMake(32, 20);
    floatBlock.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    [tabBarView addSubview:floatBlock];
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //注册了一个通知中心 接受浮动块的响应通知
    [center addObserverForName:@"MoveFloatBlock" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        UIButton * btn = (UIButton *)note.object;

        [UIView animateWithDuration:0.45 animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            floatBlock.center = CGPointMake(32+(btn.tag*64), 20);
        }];
        
    }];
    
    [self.view addSubview:tabBarView];
    
    HomeMainVC * aPage = [[HomeMainVC new]autorelease];
    aPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    HomeNav * homenav = [[[HomeNav alloc]initWithRootViewController:aPage]autorelease];
    [self.Controllers addObject:homenav];
    
    MessagerMainVC * bPage = [[MessagerMainVC new]autorelease];
    bPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    MessagerNav * messagernav = [[[MessagerNav alloc]initWithRootViewController:bPage]autorelease];
    [self.Controllers addObject:messagernav];
    
    FriendsMainVC * cPage = [[FriendsMainVC new]autorelease];
    cPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    FriendsNav * friendsnav = [[[FriendsNav alloc]initWithRootViewController:cPage]autorelease];
    [self.Controllers addObject:friendsnav];
    
    SquareMainVC * dPage = [[SquareMainVC new]autorelease];
    dPage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    SquareNav * squarenav = [[[SquareNav alloc]initWithRootViewController:dPage]autorelease];
    [self.Controllers addObject:squarenav];
    
    MoreMainVC * ePage = [[MoreMainVC new]autorelease];
    ePage.view.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 60);
    MoreNav * morenav = [[[MoreNav alloc]initWithRootViewController:ePage]autorelease];
    [self.Controllers addObject:morenav];
    
    NSLog(@"%@",self.Controllers);

    self.currNav = [self.Controllers objectAtIndex:currIndex];
//    self.currVC = [self.Controllers objectAtIndex:currIndex];
    
    [self.contentView addSubview:self.currNav.view];
    
    [center addObserverForName:@"ShowBigImg" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        NSArray * aArr = (NSArray *)note.object;
        //因为下载地址有误 可能没有 这里做了个调试打印
        //NSLog(@"%d",aArr.count);
        //NSLog(@"%@",aArr);
        
        UIImageView * imgView = [aArr objectAtIndex:0];
        T_Show_ImgVC * aImgView = [[T_Show_ImgVC new]autorelease];

        //这里是洒家智慧的结晶 通知相应就用传过来的信息 然后启动下载类 下载图片 使用 哈哈
        [self presentViewController:aImgView animated:YES completion:^{
            
            aImgView.currntImg.image = imgView.image;
            if ([aArr objectAtIndex:2]) {
                aImgView.urlStr = [aArr objectAtIndex:2];
            }else if([aArr objectAtIndex:1]){
                aImgView.urlStr = [aArr objectAtIndex:1];
            }
            
            NSLog(@"%@",aImgView.urlStr);
            
            [aImgView setfinish:^(UIImage *Img) {
//                NSLog(@"%@",Img);
                aImgView.currntImg.image = Img;
                aImgView.currntImg.frame = CGRectMake(0, 0, Img.size.width, Img.size.height);
//                aImgView.currntImg.center = CGPointMake(([UIScreen mainScreen].bounds.size.width)/2, ([UIScreen mainScreen].bounds.size.height)/2);
                CGSize contentSize = [UIScreen mainScreen].bounds.size;
                
                if (Img.size.width>320) {
                    contentSize.width = Img.size.width;
                }
                if (Img.size.height > [UIScreen mainScreen].bounds.size.height) {
                    contentSize.height = Img.size.height;
                }
                
                aImgView.ImgWin.contentSize = contentSize;
                /*
                 好吧此处我声明这里到处都是bug
                 一步一个坑爹的陷阱 需要强大的优化
                 gif图片的处理 
                 请求不中用的处理
                 网络不给力的判断以及解决方法 如何给用户更好的体验
                */
            }];

            [aImgView downLoadImg];
        }];
    }];
    
    [center addObserverForName:@"ShowQrCode" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        L_ZBarSwapViewController *reader = [L_ZBarSwapViewController new];
        reader.readerDelegate = self;
        reader.supportedOrientationsMask = ZBarOrientationMaskAll;
        
        ZBarImageScanner *scanner = reader.scanner;
        
        [scanner setSymbology: ZBAR_I25
                       config: ZBAR_CFG_ENABLE
                           to: 0];
        
        [self presentViewController:reader animated:YES completion:^{
            
        }];
        [reader release];
    }];

}

#pragma mark ----QR:

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
//    self.qrCodeImgV.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    [reader dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"扫描结果"
                                                        message:symbol.data 
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:@"Ok", nil];

        alert.delegate = self;
        alert.tag=2;
        [alert show];
        [alert release];
    
    //判断是否包含 头'http:'
//    NSString *regex = @"http+:[^\\s]*";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//    
//    //判断是否包含 头'ssid:'
//    NSString *ssid = @"ssid+:[^\\s]*";;
//    NSPredicate *ssidPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ssid];
//    self.infoLabel.text =  symbol.data ;
//
//    if ([predicate evaluateWithObject:self.infoLabel.text]) {
//        
//        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil
//                                                        message:@"It will use the browser to this URL。"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"Close"
//                                              otherButtonTitles:@"Ok", nil];
//        alert.delegate = self;
//        alert.tag=1;
//        [alert show];
//        [alert release];
//        
//    }
//    else if([ssidPre evaluateWithObject:self.infoLabel.text]){
//        
//        NSArray *arr = [self.infoLabel.text componentsSeparatedByString:@";"];
//        NSArray * arrInfoHead = [[arr objectAtIndex:0] componentsSeparatedByString:@":"];
//        NSArray * arrInfoFoot = [[arr objectAtIndex:1] componentsSeparatedByString:@":"];
//        self.infoLabel.text=
//        [NSString stringWithFormat:@"ssid: %@ \n password:%@",
//         [arrInfoHead objectAtIndex:1],[arrInfoFoot objectAtIndex:1]];
//        
//        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:self.infoLabel.text
//                                                        message:@"The password is copied to the clipboard , it will be redirected to the network settings interface"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"Close"
//                                              otherButtonTitles:@"Ok", nil];
//        
//        alert.delegate = self;
//        alert.tag=2;
//        [alert show];
//        [alert release];
//        
//        UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
//        //        然后，可以使用如下代码来把一个字符串放置到剪贴板上：
//        pasteboard.string = [arrInfoFoot objectAtIndex:1];
//        
//    }
}


-(void)viewDidAppear:(BOOL)animated{
    //此处以后要做一个跳出登录页面
//    T_WrtWeibo_VC * preVC = [[T_WrtWeibo_VC new]autorelease];
//    NSLog(@"%@",preVC);
//    [self presentViewController:preVC animated:YES completion:^{
//        ;
//    }];
}

-(void)TabBarButtonAct:(UIButton *)sender{
    self.currNav = [self.Controllers objectAtIndex:self.selected];
//    self.currVC = self.currNav.topViewController;
//    [self DisappearViewWith:self.currVC.view];
    
    [self DisappearViewWith:self.currNav.view];
    //    self.currVC.isEditing = NO;????????????
    self.selected = sender.tag;
    NSLog(@"%d",sender.tag);
    
    //底部的按钮发送通知 令浮动块移动
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"MoveFloatBlock" object:sender];
    
}

/*此方法能用来设置系统颜色 此处留有备份 以便使用
-(void)aaaa{
    NSString * file = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    file = [file stringByAppendingString:@"System Info.plist"];
    NSDictionary * aC = [NSDictionary dictionaryWithObjectsAndKeys:@"73",@"redVal",@"193",@"blueVal",@"233",@"greenVal", nil];
    NSMutableDictionary * aDic = [NSMutableDictionary dictionaryWithContentsOfFile:file];
    [aDic setObject:aC forKey:@"color"];
    [aDic writeToFile:file atomically:YES];
    NSLog(@"%@",aDic);
}
*/
-(void)DisappearViewWith:(UIView *)aView{
    CGRect rect = aView.frame;
    CGRect mutRect = self.view.frame;
    
    //anchorPoint设置后frame受影响颇大 这里采用以下方法调试 解决 但不完美 待调整
    //    mutRect.origin.x = -self.currVC.view.frame.size.width/2;
    mutRect.origin.y = aView.frame.size.height;
    aView.frame = mutRect;
    aView.layer.anchorPoint = CGPointMake(0, 1);
    
    CABasicAnimation * transformAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAni.duration = 0.35;
    transformAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(CGAffineTransformMake(0.1, -0.09, -0.09, 0.1, 0, 0))];
    transformAni.delegate = self;
    transformAni.fillMode = kCAFillModeForwards;
    transformAni.removedOnCompletion = NO;
    
    [aView.layer addAnimation:transformAni forKey:@"transform"];
    aView.frame = rect;

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //!!!!!!!!!!!!此处需要优化 若是把动画手动加到appear的view上那就太二了 要在本页结束
    self.currNav = [self.Controllers objectAtIndex:currIndex];
//    self.currVC = self.currNav.topViewController;
    [self.currNav.view removeFromSuperview];
    self.currNav = [self.Controllers objectAtIndex:self.selected];
//    self.currVC = self.currNav.topViewController;
    [self.contentView addSubview:self.currNav.view];
    currIndex = self.selected;
}

-(void)runActionForKey:(NSString *)event object:(id)anObject arguments:(NSDictionary *)dict{
    NSLog(@"%s",__func__);
}

@end 