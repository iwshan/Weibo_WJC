//
//  T_Comments_Cell.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-20.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Comments_Cell.h"

@implementation T_Comments_Cell

@synthesize userIcon , nameLab , textView , statueView , blog , height ;

-(void)dealloc{
    self.userIcon = nil;
    self.nameLab = nil;
    self.textView = nil;
    self.statueView = nil;
    self.blog = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.height = 60;
        sysSetting = [T_System_Setting shareSystemInfo];
        self.backgroundColor = [UIColor redColor];
        self.blog = [[ToMe new] autorelease];
        
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
        nameLab.frame = CGRectMake(55, 0, 190, 26);
        nameLab.font = GirlFonts14;
        //nameLab.textColor = SysColor;
        nameLab.shadowColor = [UIColor whiteColor];
        nameLab.shadowOffset = CGSizeMake(1, 1);
        nameLab.backgroundColor = ClearColor;
        
                
        textView = [[UIWebView new]autorelease];
        textView.backgroundColor = [UIColor clearColor];
        textView.scrollView.backgroundColor = [UIColor clearColor];
        textView.scrollView.bounces = NO;
        textView.opaque = NO;
        //textView.delegate = self;
        UIImageView * commentIcon = [[UIImageView new]autorelease];
        commentIcon.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"comment_count_icon" ofType:@"png"]];
        commentIcon.frame = CGRectMake(screenWidth - 17, 7, 12, 12);
        [self addSubview:commentIcon];
        
        statueView= [[UIWebView new]autorelease];
        statueView.backgroundColor = ClearColor;
        statueView.scrollView.bounces = NO;
        statueView.opaque = NO;
        statueView.backgroundColor = SysColorAlp3;
        
        //涉及到html的时候cornerRadius就不是万能的了 网页就是网页 难搞！
        statueView.layer.cornerRadius = 3;
        [self addSubview:statueView];
        
                
        UIImageView * goodPoint = [[UIImageView new]autorelease];
        goodPoint.frame = CGRectMake(220, 0, 18, 18);
        goodPoint.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"icon_unlike" ofType:@"png"]];
        
        [self addSubview:userIcon];
        [self addSubview:nameLab];
        [self addSubview:textView];

        
    }
    return self;
}


-(void)setInfo{
    // TODO:自定义图片下载类使用方法
    
//    NSLog(@"%@",self.blog.user.profileimageurl);
//    NSLog(@"%@",self.blog.user.screenname);
//    NSLog(@"%@",self.blog.text);
    
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.user.profileimageurl;

    self.userIcon.image = [down setDefautImg:[UIImage imageNamed:@"usericondefaut"] AndFinishDO:^(UIImage *Img) {
        self.userIcon.image = Img;
    }];
    
    self.nameLab.text = self.blog.user.screenname;

    [self setTextWebView];
    [self setBottomView];
    
}

-(void)setFullInfo{
    DownLoad * down = [[DownLoad new]autorelease];
    down.urlStr = self.blog.user.profileimageurl;
    
    self.userIcon.image = [down setDefautImg:[UIImage imageNamed:@"usericondefaut"] AndFinishDO:^(UIImage *Img) {
        self.userIcon.image = Img;
    }];
    
    self.nameLab.text = self.blog.user.screenname;
    
    [self setTextWebView];
    [self setStatueWebView];
    [self setBottomView];

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
    bottomLine.frame = CGRectMake(0, 0, 0, 0);
}

-(void)setStatueWebView{
    
    NSString * htmlStr =self.blog.status.text;
    //NSLog(@"%@",self.blog.status.text);

    CGSize webSize = [htmlStr sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14] constrainedToSize:CGSizeMake(260, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    webSize.width = 260;
    webSize.height += 10;
    
    self.statueView.frame = CGRectMake(54, self.height, webSize.width, webSize.height);
    self.height += self.statueView.frame.size.height + 10;
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [NSURL fileURLWithPath:resourcePath];
    
    [self.statueView loadHTMLString:[htmlStr FormatToHtml] baseURL:baseURL];
    bottomLine.frame = CGRectMake(0, 0, 0, 0);
}


-(void)setBottomView{
    
    bottomLine = [[UIImageView new]autorelease];
    bottomLine.image = bottomLineImg;
    bottomLine.frame = CGRectMake(5, self.height, 310, 2);
    [self addSubview:bottomLine];
    self.height += 2;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString * heightStr = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];

    int aHeight = [heightStr intValue];
    
    CGRect frame = webView.frame;
    
    frame.size.height = aHeight;
    webView.frame = frame;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
