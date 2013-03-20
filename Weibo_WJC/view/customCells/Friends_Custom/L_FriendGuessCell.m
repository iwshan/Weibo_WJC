//
//  L_FriendGuessCell.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_FriendGuessCell.h"

@implementation L_FriendGuessCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 35, 35)];
        imageView.image = [UIImage imageNamed:@"avatar_default_small"];
        
        [self addSubview:imageView];
        [imageView release];
        //
        UITextField * nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(45, 10, 200, 30)];
        //        nameTextField.adjustsFontSizeToFitWidth = YES;//TODO: 自适应长度；
        nameTextField.font = [UIFont fontWithName:@"Arial" size:15];
        nameTextField.enabled = NO;
        nameTextField.text = @"世界人民大团结万岁";
        nameTextField.backgroundColor = [UIColor clearColor];
        
        [self addSubview:nameTextField];
        [nameTextField release];
        //
        UITextField * titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(45, 38, 250, 25)];
        titleTextField.enabled = NO;
        titleTextField.font = [UIFont fontWithName:@"Arial" size:14];
        titleTextField.textColor = [UIColor grayColor];
        titleTextField.backgroundColor = [UIColor clearColor];
        titleTextField.text = @"100m以内";
        
        [self addSubview:titleTextField];
        [titleTextField release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
