//
//  TFacekeyboard.h
//  Weibologin
//
//  Created by TRALIN on 13-2-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFacekeyboard : UIView<UIScrollViewDelegate>

@property (nonatomic , retain) UIScrollView * FaceView;
@property (nonatomic , retain) UIPageControl * pageIndex;
@property (nonatomic , retain) T_System_Setting * sysSetting;

-(void)setSelf;

@end
