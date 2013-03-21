//
//  T_Comments_Cell.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-20.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToMe.h"

@interface T_Comments_Cell : UITableViewCell<UIWebViewDelegate>

{
    T_System_Setting * sysSetting;
    UIImageView * bottomLine;
}

@property (nonatomic , retain) UIImageView * userIcon;
@property (nonatomic , retain) UILabel * nameLab;
//这里有两个文字区域 都是UIWebView的 有时用两个 有时只用一个
@property (nonatomic , retain) UIWebView * textView;
@property (nonatomic , retain) UIWebView * statueView;

@property (nonatomic , retain) ToMe * blog;
@property (nonatomic , assign) float height;


-(void)setInfo;
-(void)setFullInfo;
@end
