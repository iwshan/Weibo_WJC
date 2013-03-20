//
//  ToMe.h
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-19.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Microblog.h"

@interface ToMe : NSObject

@property(nonatomic,retain)NSString * createdat;
@property(nonatomic,assign)int id;
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)NSString * source;
@property(nonatomic,retain)User * user;
@property(nonatomic,retain)NSString * mid;
@property(nonatomic,retain)NSString * idstr;
@property(nonatomic,retain)Microblog * status;
@property(nonatomic,retain)NSObject * replycomment;

@property(nonatomic,retain)NSString * type;

-(Class)getUserClass;
-(Class)getStatusClass;

@end



