//
//  TFacekeyboard.m
//  Weibologin
//
//  Created by TRALIN on 13-2-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TFacekeyboard.h"

@implementation TFacekeyboard

@synthesize FaceView = _FaceView , pageIndex = _pageIndex , sysSetting = _sysSetting;

-(void)dealloc{
    self.sysSetting = nil;
    self.pageIndex = nil;
    self.FaceView = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 200);
        
        self.sysSetting = [T_System_Setting shareSystemInfo];
        /*--------------------------------------------------------------
//        if (!self.sysSetting.facial) {
//            NSDictionary * faceDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotionImage" ofType:@"plist"]];
//
//            self.sysSetting.facial = [faceDic keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//                if ([obj1 intValue]<[obj2 intValue]) {
//                    return NSOrderedAscending;
//                }
//                if ([obj1 intValue]>[obj2 intValue]) {
//                    return NSOrderedDescending;
//                }
//                return NSOrderedSame;
//            }];
////            NSLog(@"%@",self.sysSetting.facial);
//        }
       --------------------------------------------------------------*/
    }

    [self setSelf];
    return self;
}

-(void)setSelf{
    self.FaceView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    self.FaceView.scrollEnabled = YES;
    self.FaceView.pagingEnabled = YES;
    self.FaceView.userInteractionEnabled = YES;
    [self addSubview:self.FaceView];
    self.backgroundColor = [UIColor colorWithRed:100/ 256.0 green:109 / 256.0f blue:122 / 256.0 alpha:1.0];

//    int faceNum = 0;
    
    int ImgIndex = 0;
    //囧 加个图片要酱紫吗 嗯 要的要的——
    UIImage * FaceImg;
//    FaceImg
    for (int i = 0;i< 4; i++)
    {
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 200)];
//        aView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 green:(arc4random() % 256) / 255.0f blue:(arc4random() % 256) / 255.0 alpha:1.0];8794108
        aView.backgroundColor = ClearColor;
        [self.FaceView addSubview:aView];
        
        for (int j = 0 ; j < 4 ; j++) {
            for (int k = 0; k < 7 ; k++) {
                
                if (ImgIndex < 105) {
                    ImgIndex++;
                }else{
                    continue;
                }
                
                UIButton * ImgBnt = [UIButton buttonWithType:UIButtonTypeCustom];
                [ImgBnt addTarget:self action:@selector(addFaceView:) forControlEvents:UIControlEventTouchUpInside];
                
                ImgBnt.frame = CGRectMake(45*k+10, 40*j+10, 32, 32);
                
                //囧 加个图片
//                FaceImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"face%d",ImgIndex] ofType:@"png"]];
                
                FaceImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%03d",ImgIndex] ofType:@"png"]];
                [ImgBnt setImage:FaceImg forState:UIControlStateNormal];
                
                ImgBnt.tag = ImgIndex;
                
                [aView addSubview:ImgBnt];

            }
        }
        
        [aView release];
    }
    
    self.FaceView.delegate = self;
    self.FaceView.contentSize = CGSizeMake(1280, 150);
    
    self.pageIndex = [[UIPageControl new]autorelease];
    self.pageIndex.frame = CGRectMake(0, 0, 120, 30);
    self.pageIndex.center = CGPointMake(160, 180);
    self.pageIndex.numberOfPages = 4;
    self.pageIndex.currentPage = 0;
    
    [self addSubview:self.pageIndex];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageIndex.currentPage = index;
}

-(void)addFaceView:(UIButton *)sender{
//    NSLog(@"tag:%d",sender.tag);
//    NSLog(@"tag:%@",[self.sysSetting.facial objectAtIndex:(sender.tag-1)]);
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"printFace" object:sender];
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
我只是一个view 东西要交给scorllview处理 并且还要有4个含有图像的键盘
*/

@end
