//
//  L_FriendAroundCell.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_FriendAroundCell.h"

@implementation L_FriendAroundCell

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
        UITextField * nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(45, 5, 200, 20)];
//        nameTextField.adjustsFontSizeToFitWidth = YES;//TODO: 自适应长度；
        nameTextField.font = [UIFont fontWithName:@"Aril" size:14];
        nameTextField.enabled = NO;
        nameTextField.text = @"世界人民大团结万岁";
        nameTextField.backgroundColor = [UIColor clearColor];
        
        [self addSubview:nameTextField];
        [nameTextField release];
        //
        UITextField * rangTextField = [[UITextField alloc]initWithFrame:CGRectMake(45, 29, 250, 20)];
        rangTextField.enabled = NO;
        rangTextField.font = [UIFont fontWithName:@"Arial" size:12];
        rangTextField.textColor = [UIColor grayColor];
        rangTextField.backgroundColor = [UIColor clearColor];
        rangTextField.text = @"100m以内";
        
        [self addSubview:rangTextField];
        [rangTextField release];
        //
        UITextField * titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(45, 45, 250, 20)];
        titleTextField.enabled = NO;
        titleTextField.font = [UIFont fontWithName:@"Arial" size:12];
        titleTextField.textColor = [UIColor grayColor];
        titleTextField.backgroundColor = [UIColor clearColor];
        titleTextField.text = @"厚德载物title";
        
        [self addSubview:titleTextField];
        [titleTextField release];
        // 
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
