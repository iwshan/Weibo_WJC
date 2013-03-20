//
//  MessagerMainVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T_Mention_TableVC.h"
#import "T_Comment_TableVC.h"
#import "T_Messages_TableVC.h"
#import "T_Notice_TableVC.h"
#import "MessagerNav.h"
#import "T_blogDetail_TableVC.h"

@interface MessagerMainVC : UIViewController
{
    int currIndex;
    T_System_Setting * sysSetting;
    UIView * customTab;
}

@property (nonatomic , retain) NSMutableArray * Controllers;
@property (nonatomic , assign) int selected;
@property (nonatomic , retain) UIViewController * currVC;
@property (nonatomic , retain) UIView * contentView;

@end
