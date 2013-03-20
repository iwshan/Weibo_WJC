//
//  T_Show_ImgVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T_Loading_View.h"

typedef void(^FinishDown) (UIImage * Img);

@interface T_Show_ImgVC : UIViewController<NSURLConnectionDataDelegate>

{
    FinishDown finishDown;
    float _fileSize;//取网络图片大小的缓存值，可删除
    NSMutableData * _data;
    NSURLConnection * conne;
    T_Loading_View * loadingView;
}
@property (nonatomic , retain) UIScrollView * ImgWin;
@property (nonatomic , retain) UIImageView * currntImg;
@property (nonatomic , retain) NSString * urlStr;

-(void)setfinish:(FinishDown)ablock;
-(void)downLoadImg;

@end
