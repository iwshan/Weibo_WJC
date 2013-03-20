//
//  L_WaveViewController.m
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "L_WaveViewController.h"

@interface L_WaveViewController ()

@end

@implementation L_WaveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.isImage = YES;

    }
    return self;
}

-(void)dealloc
{
    self.geocoder = nil;
    self.locationManager = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UILabel * textLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 250, 320, 35)]autorelease];
    textLabel.text = @"摇一摇，发现身边的朋友";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    [self.view addSubview:textLabel];
    
    self.imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)]autorelease];
    self.imageView.center = CGPointMake(160, 160);
    
    NSArray * imgArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"findfriends_shake_01"], [UIImage imageNamed:@"findfriends_shake_02"],nil];
    self.imageView.animationImages = imgArr;
    self.imageView.animationDuration = 0.85;
    [self.imageView startAnimating];
    [self.view addSubview:self.imageView];
    
    [self startLocation];
    
}


#pragma mark ---CLLocationManager---
-(void)startLocation
{
    self.locationManager = [[[CLLocationManager alloc]init]autorelease];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000.0f;

    [self.locationManager startUpdatingLocation];
    
}

//成功定位时就会调用此方法：【 更新完成：获取经纬度：】
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"纬度 = %@",[NSString stringWithFormat:@"%3.5f",newLocation.coordinate.latitude]);
    NSLog(@"经度 = %@",[NSString stringWithFormat:@"%3.5f",newLocation.coordinate.longitude]);
    
    [self.locationManager stopUpdatingLocation];
    
    self.geocoder = [[[CLGeocoder alloc]init]autorelease];
    [self.geocoder reverseGeocodeLocation:newLocation
                        completionHandler:^(NSArray *placemarks, NSError *error)
     {
         CLPlacemark * placemark = [placemarks objectAtIndex:0];
         NSLog(@"placemark = %@",placemark);
         
     }];
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败！");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
