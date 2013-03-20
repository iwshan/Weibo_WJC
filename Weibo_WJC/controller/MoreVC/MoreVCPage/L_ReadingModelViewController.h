//
//  L_ReadingModelViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface L_ReadingModelViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSMutableArray * cellDataArray;


@end
