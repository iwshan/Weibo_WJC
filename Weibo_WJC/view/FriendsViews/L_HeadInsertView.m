//
//  L_HeadInsertView.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_HeadInsertView.h"

@implementation L_HeadInsertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320-160, 190) style:UITableViewStylePlain]autorelease];
        self.tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.tableView];
        //
        self.updateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.updateButton.frame = CGRectMake(5, 195, 70, 25);
        self.updateButton.backgroundColor = [UIColor clearColor];
        [self.updateButton setTitle:@"更新" forState:UIControlStateNormal];
        [self addSubview:self.updateButton];
        //
        self.editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.editButton.frame = CGRectMake(85, 195, 70, 25);
        self.editButton.backgroundColor = [UIColor clearColor];
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [self addSubview:self.editButton];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
