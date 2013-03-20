//
//  L_LookForFriendViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "L_WaveViewController.h"
#import "L_AddressBookViewController.h"
#import "L_AroundKnowViewController.h"
#import "L_GuessKnowViewController.h"
#import "L_QrCodeViewController.h"

@interface L_LookForFriendViewController : UIViewController
{
    int currIndex;
    T_System_Setting * sysSetting;
}

@property (nonatomic , retain) NSMutableArray * Controllers;
@property (nonatomic , assign) int selected;
@property (nonatomic , retain) UIViewController * currVC;
@property (nonatomic , retain) UIView * contentView;

@property (nonatomic , assign) BOOL isHidden;

@end
