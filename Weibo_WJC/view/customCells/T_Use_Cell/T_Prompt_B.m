//
//  T_Prompt_B.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Prompt_B.h"

@implementation T_Prompt_B

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * empRetImg = [[UIImageView new]autorelease];
        empRetImg.frame = CGRectMake(0, 0, 100, 100);
        empRetImg.center = CGPointMake(160, ([UIScreen mainScreen].bounds.size.height - 260)/ 2);
        empRetImg.image = [UIImage imageNamed:@"empty_comment"];
        [self addSubview:empRetImg];
        
        UILabel * empLab = [[UILabel new]autorelease];
        empLab.frame = CGRectMake(0, 0, 140, 30);
        empLab.center = CGPointMake(160, (([UIScreen mainScreen].bounds.size.height - 280)/ 2 + 100));
        empLab.text = @"还没有人评论过，还不赶紧叽歪两三句！";
        empLab.lineBreakMode = NSLineBreakByWordWrapping;
        empLab.font = GirlFonts14;
        empLab.textColor = [UIColor grayColor];
        empLab.shadowColor = [UIColor whiteColor];
        empLab.shadowOffset = CGSizeMake(1, 1);
        empLab.backgroundColor = ClearColor;
        empLab.numberOfLines = 2;
        [self addSubview:empLab];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
