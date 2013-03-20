//
//  T_Main_Cell.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Main_Cell.h"

@implementation T_Main_Cell

@synthesize userIcon , nameLab , textView , blog , height , topView , bottomView;

-(void)dealloc{
    self.userIcon = nil;
    self.nameLab = nil;
    self.textView = nil;
    self.blog = nil;
    self.topView = nil;
    self.bottomView = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.height = 60;
        T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
        
        self.blog = [[Microblog new] autorelease];
        
        userIcon = [[UIImageView new]autorelease];
        userIcon.frame = CGRectMake(5, 5, 40, 40);
        userIcon.layer.cornerRadius = 5;
        userIcon.layer.borderColor = SysColorAlp8.CGColor;
        userIcon.layer.borderWidth = 1;
        userIcon.layer.masksToBounds = YES;
        userIcon.layer.shadowColor = [UIColor blackColor].CGColor;
        userIcon.layer.shadowOffset = CGSizeMake(2, 2);
        userIcon.layer.shadowOpacity =0.6;
        //userIcon.backgroundColor = [UIColor redColor];
        
        nameLab = [[UILabel new]autorelease];
        nameLab.frame = CGRectMake(5, 0, 190, 26);
        nameLab.font = GirlFonts14;
        //nameLab.textColor = SysColor;
        nameLab.shadowColor = [UIColor whiteColor];
        nameLab.shadowOffset = CGSizeMake(1, 1);
        nameLab.backgroundColor = ClearColor;
        
        UIImageView * retweetIcon = [[UIImageView new]autorelease];
        retweetIcon.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"retweet_count_icon" ofType:@"png"]];
        retweetIcon.frame = CGRectMake(200, 7, 12, 12);
        retweetLab = [[UILabel new]autorelease];
        retweetLab.textAlignment = NSTextAlignmentCenter;
        retweetLab.textColor = SysColor;
        retweetLab.font = Arial10;
        retweetLab.backgroundColor = ClearColor;
        retweetLab.text = @"123";
        retweetLab.frame = CGRectMake(212, 7, 20, 12);
        
        UIImageView * commentIcon = [[UIImageView new]autorelease];
        commentIcon.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"comment_count_icon" ofType:@"png"]];
        commentIcon.frame = CGRectMake(234, 7, 12, 12);
        commentLab = [[UILabel new]autorelease];
        commentLab.textAlignment = NSTextAlignmentCenter;
        commentLab.text = @"123";
        commentLab.font = Arial10;
        commentLab.textColor = SysColor;
        commentLab.backgroundColor = ClearColor;
        commentLab.frame = CGRectMake(246, 7, 20, 12);
        
        
        self.topView = [[UIView new]autorelease];
        self.topView.frame = CGRectMake(50, 2, 265, 26);
        self.topView.backgroundColor = ClearColor;

        [self.topView addSubview:retweetIcon];
        [self.topView addSubview:retweetLab];
        [self.topView addSubview:commentIcon];
        [self.topView addSubview:commentLab];
        [self.topView addSubview:nameLab];
        
        textView = [[UIWebView new]autorelease];
        textView.backgroundColor = [UIColor clearColor];
        textView.scrollView.backgroundColor = [UIColor clearColor];
        textView.scrollView.bounces = NO;
        textView.opaque = NO;
        //textView.delegate = self;

        bottomView = [[UIView new]autorelease];
        bottomView.frame = CGRectMake(54, 0, 260, 18);
        bottomView.backgroundColor = [UIColor redColor];
        
        [self addSubview:bottomView];
        [self addSubview:userIcon];
        [self addSubview:self.topView];
        [self addSubview:textView];
        
    }
    return self;
}

-(void)setInfo{
    // TODO:自定义图片下载类使用方法
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.user.profileimageurl;
    
    self.userIcon.image = [down setDefautImg:[UIImage imageNamed:@"image"] AndFinishDO:^(UIImage *Img) {
        self.userIcon.image = Img;
    }];
    
    //-----------------------------------------------------------------------------------------------
    self.nameLab.text = self.blog.user.screenname;
    
    NSString * htmlStr =self.blog.text;
    CGSize webSize = [htmlStr sizeWithFont:[UIFont fontWithName:@"Arial" size:14] constrainedToSize:CGSizeMake(260, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];

    webSize.width = 260;
    webSize.height += 14;
    
    self.textView.frame = CGRectMake(54, 30, webSize.width, webSize.height);
    self.height = 28 + self.textView.frame.size.height;
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [NSURL fileURLWithPath:resourcePath];
    
    [self.textView loadHTMLString:[htmlStr FormatToHtml] baseURL:baseURL];

    //NSLog(@"%f",self.textView.frame.size.height);
    
    self.bottomView.frame = CGRectMake(54, self.height, 260, 18);
//    self.height += 23 ;
    /*这部分等数据了 先写页面了 没数据写不下去了
    if (self.cellData.profileUrl) {
        self.profileImg.frame = CGRectMake(5, 55+self.textView.frame.size.height, 80, 80);
        DownLoad * down = [[DownLoad new]autorelease];
        down.urlStr = self.cellData.profileUrl;
        self.profileImg.image = [down setDefautImg:nil AndFinishDO:^(UIImage *Img) {
            self.profileImg.image = Img;
        }];
        self.height = self.height + self.profileImg.frame.size.height + 5;
    }else{
        self.profileImg.hidden = YES;
    }
     */
    
}

-(void)setBottomView{
    self.bottomView.frame = CGRectMake(54, self.height, 260, 18);
    self.height += 23 ;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString * heightStr = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
    //NSLog(@"%@",heightStr);
    int aHeight = [heightStr intValue];
    
    CGRect frame = webView.frame;
    
    frame.size.height = aHeight;
    webView.frame = frame;
    /*
    self.height = 55 + self.textView.frame.size.height;

    if (self.cellData.profileUrl) {
        self.profileImg.frame = CGRectMake(5, 55+self.textView.frame.size.height, 80, 80);
        DownLoad * down = [[DownLoad new]autorelease];
        down.urlStr = self.cellData.profileUrl;
        self.profileImg.image = [down setDefautImg:nil AndFinishDO:^(UIImage *Img) {
            self.profileImg.image = Img;
        }];
        self.height = self.height + self.profileImg.frame.size.height + 5;
    }else{
        self.profileImg.hidden = YES;
    }
    
*/
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
