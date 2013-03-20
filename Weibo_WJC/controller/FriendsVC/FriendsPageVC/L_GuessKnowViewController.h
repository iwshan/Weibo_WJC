//
//  L_GuessKnowViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "L_FriendGuessCell.h"

@interface L_GuessKnowViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>




@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSMutableArray * cellDataArray;


@end
