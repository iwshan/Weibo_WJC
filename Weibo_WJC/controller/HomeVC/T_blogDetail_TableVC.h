//
//  T_blogDetail_TableVC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T_Main_Cell.h"
#import "T_Prompt_A.h"
#import "T_Prompt_B.h"

@interface T_blogDetail_TableVC : UITableViewController

{
    T_System_Setting * sysSetting;
}

@property (nonatomic , retain) Microblog * aBlog;
@property (nonatomic , retain) NSMutableArray * commontArr;


@end
