//
//  DefineSetting.h
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-11.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#ifndef Weibo_WJC_DefineSetting_h
#define Weibo_WJC_DefineSetting_h

typedef enum CellType{
    Text_Cell = 0,
    TextImage_Cell,
    ReText_Cell,
    ReImage_Cell,
}CellType;

#define nav_Bg [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nav_bg" ofType:@"png"]]
#define bottomLineImg [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"contentSprarator" ofType:@"png"]]
//--------------------------------------------------------------------
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

//--------------------------------系统字体------------------------------
#define GirlFonts16 [UIFont fontWithName:@"DFPShaoNvW5-GB" size:16]
#define GirlFonts14 [UIFont fontWithName:@"DFPShaoNvW5-GB" size:14]
#define Arial10 [UIFont fontWithName:@"Arial" size:10]
#define Arial12 [UIFont fontWithName:@"Arial" size:12]

#define ClearColor [UIColor clearColor]
#define GrayBG [UIColor colorWithRed:239/256.0 green:239/256.0 blue:239/256.0 alpha:1]
#define SysColor [UIColor colorWithRed:[[sysSetting.setColor valueForKey:@"redVal"] intValue]/256.0 green:[[sysSetting.setColor valueForKey:@"greenVal"] intValue]/256.0 blue:[[sysSetting.setColor valueForKey:@"blueVal"] intValue]/256.0 alpha:1]

#define SysColorAlp3 [UIColor colorWithRed:[[sysSetting.setColor valueForKey:@"redVal"] intValue]/256.0 green:[[sysSetting.setColor valueForKey:@"greenVal"] intValue]/256.0 blue:[[sysSetting.setColor valueForKey:@"blueVal"] intValue]/256.0 alpha:0.3]

#define SysColorAlp6 [UIColor colorWithRed:[[sysSetting.setColor valueForKey:@"redVal"] intValue]/256.0 green:[[sysSetting.setColor valueForKey:@"greenVal"] intValue]/256.0 blue:[[sysSetting.setColor valueForKey:@"blueVal"] intValue]/256.0 alpha:0.6]

#define SysColorAlp8 [UIColor colorWithRed:[[sysSetting.setColor valueForKey:@"redVal"] intValue]/256.0 green:[[sysSetting.setColor valueForKey:@"greenVal"] intValue]/256.0 blue:[[sysSetting.setColor valueForKey:@"blueVal"] intValue]/256.0 alpha:0.8]

#endif
