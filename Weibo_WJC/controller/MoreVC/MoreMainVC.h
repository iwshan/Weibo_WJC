//
//  MoreMainVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "T_Sys_Btn.h"
#import "L_SettingViewController.h"
#import "L_DraftCartonViewController.h"
#import "L_MoreVCCell.h"
#import "L_AccountManagementViewController.h"
#import "L_ReadingModelViewController.h"
#import "L_ThemeViewController.h"
#import "T_About_VC.h"

@interface MoreMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView * tableViewC;
@property(nonatomic,retain)NSMutableArray * cellDataArray;
@property(nonatomic,retain)NSMutableArray * cellNameArray;
@property(nonatomic,retain)NSMutableArray * imageTitleArr;


@end

