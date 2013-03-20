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
        sysSetting = [T_System_Setting shareSystemInfo];
        self.blog = [[Microblog new] autorelease];
        
        userIcon = [[UIImageView new]autorelease];
        userIcon.frame = CGRectMake(5, 5, 40, 40);
        userIcon.layer.cornerRadius = 5;
        userIcon.layer.borderColor = SysColorAlp8.CGColor;
        userIcon.layer.borderWidth = 1;
        userIcon.layer.masksToBounds = YES;
        userIcon.userInteractionEnabled = YES;
        
//        userIcon.layer.shadowColor = [UIColor blackColor].CGColor;
//        userIcon.layer.shadowOffset = CGSizeMake(2, 2);
//        userIcon.layer.shadowOpacity =0.6;
//        userIcon.layer.shadowRadius = 10;
        
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
        retweetLab.frame = CGRectMake(212, 7, 20, 12);
        
        UIImageView * commentIcon = [[UIImageView new]autorelease];
        commentIcon.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"comment_count_icon" ofType:@"png"]];
        commentIcon.frame = CGRectMake(234, 7, 12, 12);
        commentLab = [[UILabel new]autorelease];
        commentLab.textAlignment = NSTextAlignmentCenter;
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
//        bottomView.frame = CGRectMake(54, 0, 260, 18);
//        bottomView.backgroundColor = [UIColor redColor];
        
        dateLab = [[UILabel new]autorelease];
        dateLab.frame = CGRectMake(0, 0, 50, 18);
        dateLab.text = @"今天 17:30";
        dateLab.font = Arial10;
        dateLab.backgroundColor = ClearColor;
        dateLab.textColor = SysColor;
        
        fromDevice = [[UILabel new]autorelease];
        fromDevice.frame = CGRectMake(50, 0, 70, 18);
        fromDevice.text = @"来自官方微博";
        fromDevice.font = Arial10;
        fromDevice.backgroundColor = ClearColor;
        fromDevice.textColor = [UIColor grayColor];
        
        UIImageView * goodPoint = [[UIImageView new]autorelease];
        goodPoint.frame = CGRectMake(220, 0, 18, 18);
        goodPoint.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"icon_unlike" ofType:@"png"]];
        
        goodLab = [[UILabel new]autorelease];
        goodLab.frame = CGRectMake(240, 3, 20, 18);
        goodLab.font = Arial10;
        goodLab.textColor = SysColor;
        goodLab.backgroundColor = ClearColor;
        goodLab.textAlignment = NSTextAlignmentCenter;
        
        [bottomView addSubview:dateLab];
        [bottomView addSubview:fromDevice];
        [bottomView addSubview:goodPoint];
        [bottomView addSubview:goodLab];
        
        self.thumbImg = [[UIImageView new]autorelease];
        self.thumbImg.contentMode = UIViewContentModeScaleAspectFit;
        self.thumbImg.backgroundColor = SysColorAlp3;
        self.thumbImg.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.6].CGColor;
        self.thumbImg.layer.borderWidth = 3;
        
        self.reView = [[UIView new]autorelease];
        self.reView.backgroundColor = SysColorAlp3;
        
        self.reTweetView = [[UIWebView new]autorelease];
        self.reTweetView.backgroundColor = ClearColor;
        self.reTweetView.scrollView.backgroundColor = ClearColor;
        self.reTweetView.scrollView.bounces = NO;
        self.reTweetView.opaque = NO;
        
        [self.reView addSubview:self.reTweetView];
        self.reView.layer.cornerRadius = 3;
        [self addSubview:self.reView];
        
        self.reTweethumbImg = [[UIImageView new]autorelease];
        self.reTweethumbImg.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.6].CGColor;
        self.reTweethumbImg.layer.borderWidth = 3;
        self.reTweethumbImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.reView addSubview:self.reTweethumbImg];
        
        [self addSubview:self.thumbImg];
        [self addSubview:bottomView];
        [self addSubview:userIcon];
        [self addSubview:self.topView];
        [self addSubview:textView];
        
        UITapGestureRecognizer * showImg = [[UITapGestureRecognizer new]autorelease];
        [showImg addTarget:self action:@selector(showImg:)];
        [self.thumbImg addGestureRecognizer:showImg];
        self.thumbImg.userInteractionEnabled = YES;
        
        showImg = [[UITapGestureRecognizer new]autorelease];
        [showImg addTarget:self action:@selector(showImg:)];
        [self.reTweethumbImg addGestureRecognizer:showImg];
        self.reTweethumbImg.userInteractionEnabled = YES;
        
    }
    return self;
}

-(void)showImg:(UITapGestureRecognizer *)sender{
    //NSLog(@"%@",sender.view);
    NSArray * aArr = [NSArray array];
    switch (self.blog.type) {
        case TextImage_Cell:
        {
            aArr = [NSArray arrayWithObjects:sender.view,self.blog.bmiddlepic,self.blog.originalpic, nil];
        }
            break;
        case ReImage_Cell:
        {
            aArr = [NSArray arrayWithObjects:sender.view,self.blog.retweetedstatus.bmiddlepic,self.blog.retweetedstatus.originalpic, nil];
        }
            break;
            
        default:
            break;
    }
    
//    NSLog(@"%@",self.blog.bmiddlepic);时有时无
//    NSLog(@"%@",self.blog.originalpic);
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"ShowBigImg" object:aArr];

}

-(void)setInfo{
    // TODO:自定义图片下载类使用方法
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.user.profileimageurl;
    
    self.userIcon.image = [down setDefautImg:[UIImage imageNamed:@"usericondefaut"] AndFinishDO:^(UIImage *Img) {
        self.userIcon.image = Img;
    }];
    
    retweetLab.text = @"20"; //[NSString stringWithFormat:@"%d",self.blog.repostscount];
//    NSLog(@"%@",self.blog.repostscount);//出来都是一亿以上的数
//    NSLog(@"%@",self.blog.Id);
    commentLab.text = @"20"; //[NSString stringWithFormat:@"%d",self.blog.commentscount];
    goodLab.text = @"10"; //[NSString stringWithFormat:@"%d",self.blog.attitudescount];
    
//    NSLog(@"%@",self.blog.createdat);//Sat Mar 16 10:39:19 +0800 2013 这尼玛是啥玩意啊
//    NSLog(@"%@",self.blog.source);//这个值是个a标签 我情何以堪呐
    
    //-----------------------------------------------------------------------------------------------
    self.nameLab.text = self.blog.user.screenname;
    switch (self.blog.type) {
        case Text_Cell:
        {
            [self setTextWebView];
            [self setBottomView];
        
        }
            break;
        case TextImage_Cell:
        {
            [self setTextWebView];
            [self setDownThumbImg];
            [self setBottomView];
        }
            break;
        case ReText_Cell:
        {
            [self setTextWebView];
            [self setReTextWebView];
            [self setBottomView];
        }
            break;
        case ReImage_Cell:
        {
            [self setTextWebView];
            [self setReTextWebView];
            [self setDownReThumbImg];
            [self setBottomView];
        }
            break;
            
        default:
            break;
    }

}

-(void)setTextWebView{
    
    NSString * htmlStr =self.blog.text;
    CGSize webSize = [htmlStr sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14] constrainedToSize:CGSizeMake(260, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    webSize.width = 260;
    webSize.height += 10;
    
    self.textView.frame = CGRectMake(54, 30, webSize.width, webSize.height);
    self.height = 28 + self.textView.frame.size.height;
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [NSURL fileURLWithPath:resourcePath];
    
    [self.textView loadHTMLString:[htmlStr FormatToHtml] baseURL:baseURL];
    self.thumbImg.frame = CGRectMake(0, 0, 0, 0);
    self.reTweethumbImg.frame = CGRectMake(0, 0, 0, 0);
    self.reView.frame = CGRectMake(0, 0, 0, 0);
    self.reTweetView.frame = CGRectMake(0, 0, 0, 0);
    bottomLine.frame = CGRectMake(0, 0, 0, 0);
}

-(void)setDownThumbImg{
    self.thumbImg.frame = CGRectMake(54, self.height + 5, 80, 80);
    
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.thumbnailpic;
    self.thumbImg.image = [down setDefautImg:[UIImage imageNamed:@"page_image_loading"] AndFinishDO:^(UIImage *Img) {
        self.thumbImg.image = Img;
    }];
    
    self.height += 90;
}

-(void)setReTextWebView{
    NSString * htmlStr =self.blog.retweetedstatus.text;
    CGSize webSize = [htmlStr sizeWithFont:[UIFont fontWithName:@"Arial" size:14] constrainedToSize:CGSizeMake(240, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    webSize.width = 240;
    webSize.height += 10;
    
    self.reView.frame = CGRectMake(54, self.height, 260, webSize.height + 10);
    
    self.reTweetView.frame = CGRectMake(10, 5, webSize.width, webSize.height);
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [NSURL fileURLWithPath:resourcePath];
    
    [self.reTweetView loadHTMLString:[htmlStr FormatToHtml] baseURL:baseURL];
    self.height += (20 + self.reTweetView.frame.size.height);

}
-(void)setDownReThumbImg{
    self.reTweethumbImg.frame = CGRectMake(10, self.reTweetView.frame.size.height +10 , 80, 80);
    CGRect frame = self.reView.frame;
    frame.size.height += 90;
    self.reView.frame = frame;
    
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.retweetedstatus.thumbnailpic;
    self.reTweethumbImg.image = [down setDefautImg:[UIImage imageNamed:@"page_image_loading"] AndFinishDO:^(UIImage *Img) {
        self.reTweethumbImg.image = Img;
    }];
    
    self.height += 90;

}
-(void)setBottomView{
    
    self.bottomView.frame = CGRectMake(54, self.height, 260, 18);
    self.height += 23 ;
    
    bottomLine = [[UIImageView new]autorelease];
    bottomLine.image = bottomLineImg;
    bottomLine.frame = CGRectMake(5, self.height, 310, 2);
    [self addSubview:bottomLine];
    self.height += 2;
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
