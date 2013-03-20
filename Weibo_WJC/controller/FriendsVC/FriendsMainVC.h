//
//  FriendsMainVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "L_HeadInsertView.h"
#import "L_LookForFriendViewController.h"
#import "L_AroundKnowViewController.h"
#import "L_FansViewController.h"
#import "L_CollectionViewController.h"
#import "L_WeiboPageViewController.h"


@interface FriendsMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath * headSelectInteger;
    
}

@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)UIView * cellHeadView;

@property(nonatomic,retain)NSMutableArray * cellDataArray;

@property(nonatomic,retain)L_HeadInsertView * headInserV;
@property(nonatomic,retain)NSMutableArray * headCellDataArr;
@property(nonatomic,retain)UIButton * headViewButton;
@property(nonatomic,retain)NSMutableArray * headCellLabelDataArr;

@end
