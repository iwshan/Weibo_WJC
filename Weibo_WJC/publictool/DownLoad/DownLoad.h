//
//  DownLoad.h
//  TDownLoader
/*
 
 自行编写下载类 原理很简单 一个异步下载而已
 只不过设置了一个块 图片下载完毕会自动加载到预留图片处
 
 */
//  Created by TRALIN on 13-1-25.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishDown) (UIImage * Img);

@interface DownLoad : NSObject<NSURLConnectionDataDelegate>

{
    FinishDown finishDown;
//    float _fileSize;//取网络图片大小的缓存值，可删除
    NSMutableData * _data;
}

@property (nonatomic , retain)NSString * urlStr;

-(void)download;
-(void)setfinish:(FinishDown)ablock;
-(UIImage *)setDefautImg:(UIImage *)Img AndFinishDO:(FinishDown)ablock;

@end
