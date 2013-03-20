//
//  TMainViewController.h
//  CustomTabBarVC
//
//  Created by TRALIN on 13-3-1.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPassPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TMainViewController : UIViewController<CAAction>

{
    int currIndex;
    CGPoint startP;
    CGPoint endP;
}

@property (nonatomic , retain) NSMutableArray * Controllers;
@property (nonatomic , assign) int selected;
@property (nonatomic , retain) UIViewController * currVC;
@property (nonatomic , retain) UIView * contentView;

@end
