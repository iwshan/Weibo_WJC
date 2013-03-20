//
//  L_DraftCartonViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "L_DraftCartonCell.h"

@interface L_DraftCartonViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,assign)BOOL isHaveData;
@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSMutableArray * cellDataArray;// 从CoreData中取数据;


@end
