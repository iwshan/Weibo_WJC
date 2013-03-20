//
//  L_AccountManagementViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "T_Sys_Btn.h"

@interface L_AccountManagementViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSString * userNameStr;


@end
