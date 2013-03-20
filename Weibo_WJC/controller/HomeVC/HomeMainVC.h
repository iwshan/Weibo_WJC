//
//  HomeMainVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownLoad.h"

//---------cell部分--------
#import "T_Main_Cell.h"
//-------------------------
#import "T_Show_ImgVC.h"

#import "NSString+Html.h"
#import "T_WrtWeibo_VC.h"
#import "SinaWeiboRequest.h"
#import "SystemCenter.h"
#import "Microblog.h"
#import "T_blogDetail_TableVC.h"
#import "DownLoad.h"

@interface HomeMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , retain) NSArray * dataSourc;
@property (nonatomic , retain) UITableView * tableView;

@end
