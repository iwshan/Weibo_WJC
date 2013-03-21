//
//  Microblog.h
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-12.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Microblog : NSObject

@property(nonatomic,retain)NSString * createdat;
@property(nonatomic,retain)NSString * Id;
@property(nonatomic,retain)NSString * mid;
@property(nonatomic,retain)NSString * idstr;
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)NSString * source;
@property(nonatomic,assign)bool favorited;
@property(nonatomic,assign)bool truncated;
@property(nonatomic,retain)NSString * inreplytostatusid;
@property(nonatomic,retain)NSString * inreplytouserid;
@property(nonatomic,retain)NSString * inreplytoscreenname;
@property(nonatomic,retain)NSString * thumbnailpic;
@property(nonatomic,retain)NSString * bmiddlepic;
@property(nonatomic,retain)NSString * originalpic;
@property(nonatomic,retain)NSObject * geo;
@property(nonatomic,retain)User * user;
@property(nonatomic,retain)Microblog * retweetedstatus;
@property(nonatomic,retain)NSString * repostscount;
@property(nonatomic,retain)NSString * commentscount;
@property(nonatomic,retain)NSString * attitudescount;
@property(nonatomic,retain)NSString * mlevel;
@property(nonatomic,retain)NSObject * visible;
//文档里没有的 
@property(nonatomic,assign)int  pid;
@property(nonatomic,retain)NSString * annotations;
@property(nonatomic,retain)NSString * deleted;
@property(nonatomic,retain)NSString * Feature;
//----------
@property(nonatomic,assign)CellType type;



-(Class)getUserClass;
-(Class)getRetweetedstatusClass;


@end
