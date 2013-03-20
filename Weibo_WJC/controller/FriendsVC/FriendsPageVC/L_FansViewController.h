//
//  L_FansViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeMainVC.h"

@interface L_FansViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSMutableArray * cellDataArray;

@end
