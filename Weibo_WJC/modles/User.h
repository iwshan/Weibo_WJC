//
//  User.h
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,assign)int id;
@property(nonatomic,retain)NSString * idstr;
@property(nonatomic,retain)NSString * screenname;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,assign)int province;
@property(nonatomic,assign)int city;
@property(nonatomic,retain)NSString * location;
@property(nonatomic,retain)NSString * description;
@property(nonatomic,retain)NSString * url;
@property(nonatomic,retain)NSString * profileimageurl;
@property(nonatomic,retain)NSString * profileurl;
@property(nonatomic,retain)NSString * domain;
@property(nonatomic,retain)NSString * weihao;
@property(nonatomic,retain)NSString * gender;
@property(nonatomic,assign)int followerscount;
@property(nonatomic,assign)int friendscount;
@property(nonatomic,assign)int statusescount;
@property(nonatomic,assign)int favouritescount;
@property(nonatomic,retain)NSString * createdat;
@property(nonatomic,assign)bool following;
@property(nonatomic,assign)bool allowallactmsg;
@property(nonatomic,assign)bool geoenabled;
@property(nonatomic,assign)bool verified;
@property(nonatomic,assign)int verifiedtype;
@property(nonatomic,retain)NSString * remark;
@property(nonatomic,retain)NSObject * status;
@property(nonatomic,assign)bool allowallcomment;
@property(nonatomic,retain)NSObject * avatarlarge;
@property(nonatomic,retain)NSObject * verifiedreason;
@property(nonatomic,assign)bool followme;
@property(nonatomic,assign)int onlinestatus;
@property(nonatomic,assign)int bi_Followerscount;
@property(nonatomic,retain)NSString * lang;

@property(nonatomic,retain)NSString * mbtype;
@property(nonatomic,retain)NSString * bifollowerscount;
@property(nonatomic,retain)NSString * star;
@property(nonatomic,retain)NSString * blockword;
@property(nonatomic,retain)NSString * mbrank;
@property(nonatomic,retain)NSString * coverimage;



@end
