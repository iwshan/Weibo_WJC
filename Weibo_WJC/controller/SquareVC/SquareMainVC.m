//
//  SquareMainVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "SquareMainVC.h"

@interface SquareMainVC ()

@end

@implementation SquareMainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的广场";
    self.view.backgroundColor = GrayBG;
//    self.view.backgroundColor = ClearColor;
    
}

@end
