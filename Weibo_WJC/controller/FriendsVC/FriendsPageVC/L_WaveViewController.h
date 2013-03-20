//
//  L_WaveViewController.h
//  Weibo_WJC
//
//  Created by IT技术QQ群194638960 on 13-3-16.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface L_WaveViewController : UIViewController<CLLocationManagerDelegate>


@property(nonatomic,assign)BOOL isImage;
@property(nonatomic,retain)UIImageView * imageView;

@property(nonatomic,retain)CLLocationManager * locationManager;
@property(nonatomic,retain)CLGeocoder * geocoder;


@end
