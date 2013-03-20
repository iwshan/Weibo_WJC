//
//  T_WrtWeibo_VC.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T_Sys_Btn.h"
#import "TFacekeyboard.h"

@interface T_WrtWeibo_VC : UIViewController
{
    BOOL isFace;
    UITextView * WrtField;
    T_System_Setting * sysSetting;
}
@end
