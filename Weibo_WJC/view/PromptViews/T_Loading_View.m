//
//  T_Loading_View.m
//  loading
//
//  Created by TRALIN on 13-3-15.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Loading_View.h"

@implementation T_Loading_View

@synthesize loadingLab;

-(void)dealloc{
    self.loadingLab = nil;
    [super dealloc];
}

- (id)init{
    self = [super init];
    if (self) {
        T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-88);
        
        UIImageView * loading = [[UIImageView new]autorelease];
        loading.frame = CGRectMake(0, 0, 16, 12);
        loading.center = CGPointMake(35, 30);
        
        NSArray * imgArr = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"Load1"],
                            [UIImage imageNamed:@"Load2"],
                            [UIImage imageNamed:@"Load3"],
                            [UIImage imageNamed:@"Load4"],
                            [UIImage imageNamed:@"Load5"],
                            [UIImage imageNamed:@"Load6"],
                            nil];
        
        loading.animationImages = imgArr;
        loading.animationDuration = 0.8;
        [loading startAnimating];
        
        loadingLab = [[UILabel new]autorelease];
        loadingLab.frame = CGRectMake(0, 0, 100, 40);
        loadingLab.center = CGPointMake(100, 30);
        loadingLab.backgroundColor = [UIColor clearColor];
        loadingLab.font = [UIFont fontWithName:@"Arial" size:15];
        loadingLab.text = @"Loading...";
        
        UIView * loadView = [[UIView new]autorelease];
        loadView.frame = CGRectMake(0, 0, 140, 60);
        loadView.center = CGPointMake(160, ([UIScreen mainScreen].bounds.size.height-88)/2-30);
        loadView.backgroundColor = [UIColor colorWithWhite:1 alpha:1.0];
//        loadView.layer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3]
        loadView.layer.shadowColor = [UIColor colorWithWhite:0 alpha:1].CGColor;
        loadView.layer.shadowOffset = CGSizeMake(0, 0);
        loadView.layer.shadowOpacity = 0.5;
        loadView.layer.shadowRadius = 10;

        loadView.layer.borderColor = SysColorAlp6.CGColor;
        loadView.layer.borderWidth = 3;
        loadView.layer.cornerRadius = 8;
        
        [loadView addSubview:loadingLab];
        [loadView addSubview:loading];
        
        [self addSubview:loadView];
    }
    return self;
}

-(void)finishLoading{
    [UIView animateWithDuration:0.45 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
