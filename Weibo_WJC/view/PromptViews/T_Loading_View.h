//
//  T_Loading_View.h
//  loading
//
//  Created by TRALIN on 13-3-15.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T_Loading_View : UIView

@property (nonatomic , retain) UILabel * loadingLab;

-(void)finishLoading;

@end
