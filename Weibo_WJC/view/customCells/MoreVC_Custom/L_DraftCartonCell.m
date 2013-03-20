//
//  L_DraftCartonCell.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_DraftCartonCell.h"

@implementation L_DraftCartonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.titleTextField = [[[UITextField alloc]initWithFrame:CGRectMake(5, 10, 100,25)]autorelease];
        self.titleTextField.textAlignment = NSTextAlignmentLeft;
        self.titleTextField.enabled = NO;
        self.titleTextField.text = @"微博";
        self.titleTextField.backgroundColor = [UIColor yellowColor];

        [self addSubview:self.titleTextField];
        
        
        self.timeTextField = [[[UITextField alloc]initWithFrame:CGRectMake(150, 10, 120, 25)]autorelease];
        self.timeTextField.textAlignment = NSTextAlignmentRight;
        self.timeTextField.enabled = NO;
        self.timeTextField.backgroundColor = [UIColor purpleColor];
        self.timeTextField.text = @"test_time";
        
        [self addSubview:self.timeTextField];
        
        
        self.textTextField = [[[UITextField alloc]initWithFrame:CGRectMake(5, 40, 310, 25)]autorelease];
        self.textTextField.textAlignment = NSTextAlignmentLeft;
        self.textTextField.enabled = NO;
        self.textTextField.backgroundColor = [UIColor blueColor];
        self.textTextField.text = @"test_text";
        
        [self addSubview:self.textTextField];
        
    }
    return self;
}

-(void)dealloc
{
    self.titleTextField = nil;
    self.textTextField = nil;
    self.timeTextField = nil;
    
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
