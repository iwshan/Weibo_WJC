//
//  TMainViewController.h
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-1.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeMainVC.h"
#import "HomeNav.h"
#import "MessagerMainVC.h"
#import "MessagerNav.h"
#import "FriendsMainVC.h"
#import "FriendsNav.h"
#import "SquareMainVC.h"
#import "SquareNav.h"
#import "MoreMainVC.h"
#import "MoreNav.h"
#import "T_WrtWeibo_VC.h"
#import "T_Loading_View.h"
#import "ZBarSDK.h"
#import "L_ZBarSwapViewController.h"

@interface TMainViewController : UIViewController<CAAction,ZBarReaderDelegate,UIAlertViewDelegate >

{
    int currIndex;
    T_System_Setting * sysSetting;
}

@property (nonatomic , retain) NSMutableArray * Controllers;
@property (nonatomic , assign) int selected;
@property (nonatomic , retain) UIViewController * currVC;
@property (nonatomic , retain) UINavigationController * currNav;
@property (nonatomic , retain) UIView * contentView;

@end
