//
//  T_Show_ImgVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-17.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "T_Show_ImgVC.h"

@interface T_Show_ImgVC ()

@end

@implementation T_Show_ImgVC

@synthesize currntImg , ImgWin , urlStr;

-(void)dealloc{
    self.urlStr = nil;
    self.ImgWin = nil;
    self.currntImg = nil;
    
    if (conne) {
        [conne cancel];
    }
    
    [super dealloc];
}

-(void)setfinish:(FinishDown)ablock{
    [finishDown release];
    finishDown = [ablock copy];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _data = [[NSMutableData alloc]init];
        self.ImgWin = [[UIScrollView new]autorelease];
        self.currntImg = [[UIImageView new]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.currntImg.frame = CGRectMake(0, 0, 200, 200);
    self.currntImg.center = CGPointMake(160, 230);
    self.currntImg.contentMode = UIViewContentModeScaleAspectFit;
//    self.currntImg.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.currntImg.layer.shadowOffset = CGSizeMake(1, 1);
//    self.currntImg.layer.shadowOpacity = 0.4;
//    self.currntImg.layer.shadowRadius = 20;
    
    self.ImgWin.frame = [UIScreen mainScreen].bounds;
    [self.ImgWin addSubview:self.currntImg];
    [self.view addSubview:self.ImgWin];
    UITapGestureRecognizer * dismissRecon = [[UITapGestureRecognizer new]autorelease];

//    int64_t delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        <#code to be executed on the main queue after delay#>
//    });

    [dismissRecon addTarget:self action:@selector(dismissSelf:)];
    [self.ImgWin addGestureRecognizer:dismissRecon];
    self.ImgWin.userInteractionEnabled = YES;
    
//    UITapGestureRecognizer * zoomImg = [[UITapGestureRecognizer new]autorelease];
//    [zoomImg addTarget:self action:@selector(zoomImg:)];
//    [self.currntImg addGestureRecognizer:zoomImg];
//    zoomImg.numberOfTapsRequired = 2;
//    zoomImg.numberOfTouchesRequired = 2;
//    self.currntImg.userInteractionEnabled = YES;

    
}

-(void)downLoadImg{
    if (self.urlStr) {
        NSURL * url = [NSURL URLWithString:self.urlStr];
        NSURLRequest * req = [NSURLRequest requestWithURL:url];
        conne = [NSURLConnection connectionWithRequest:req delegate:self];
        
    }else{
        NSLog(@"Img have no Url!");
    }
}

-(void)dismissSelf:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired == 1) {
        [self dismissViewControllerAnimated:YES completion:^{
            ;
        }];
    }
}

//-(void)zoomImg:(UITapGestureRecognizer *)sender{
//    if (sender.numberOfTouchesRequired == 2) {
//        NSLog(@"2");
//    }
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- connection delegate ---

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _fileSize = response.expectedContentLength;
    loadingView = [[T_Loading_View new]autorelease];
    [self.view addSubview:loadingView];
    loadingView.loadingLab.text = @"load : %0%%";
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
    int a = [_data length];
    loadingView.loadingLab.text = [NSString stringWithFormat:@"load : %.0f%%",a/_fileSize*100];
    //NSLog(@"%s%0.f%%",__func__,a/_fileSize*100);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    loadingView.loadingLab.text = @"loading OK!";
    [loadingView finishLoading];
    UIImage * Img = [UIImage imageWithData:_data];
    if (finishDown) {
        finishDown(Img);
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    loadingView.loadingLab.text = @"地址错误";
    
    NSLog(@"%@",error.description);
    NSLog(@"%@",self.urlStr);
}


@end
