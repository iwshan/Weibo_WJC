//
//  L_ThemeViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-15.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface L_ThemeViewController : UIViewController
{
    UIImageView * themeImg;
    T_System_Setting * sysSetting;
}
@property(nonatomic,retain)NSString * value;
@property(nonatomic,retain)UILabel * label;

@property(nonatomic,assign)CGFloat rInt;
@property(nonatomic,assign)CGFloat gInt;
@property(nonatomic,assign)CGFloat bInt;

@end
