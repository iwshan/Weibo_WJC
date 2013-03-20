//
//  T_Sys_Btn.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Sys_Btn.h"

@implementation T_Sys_Btn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
        self.frame = frame;
        self.titleLabel.font = GirlFonts16;
        self.showsTouchWhenHighlighted = YES;
        self.backgroundColor = SysColor;
        self.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 3;
//        self.layer.shadowColor = [UIColor whiteColor].CGColor;
//        self.layer.shadowOffset = CGSizeMake(0, 1);
//        self.layer.shadowOpacity = 0.2;

    }
    return self;
}

@end
