//
//  RequestUrlToModel.m
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-13.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "RequestUrlToModel.h"
#import "RequestUrlModel.h"

@implementation RequestUrlToModel

-(void)dealloc{
    self.dicList = nil;
    [super dealloc];
}

static RequestUrlToModel * requestUrlToModel;

+(RequestUrlToModel*)shareRequestUrlToModel{
   
    if (!requestUrlToModel) {
        RequestUrlModel * aRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/statuses/public_timeline.json" WithModelName:@"Microblog" WithParseNode:@"statuses"]autorelease];
        
        RequestUrlModel * bRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/statuses/friends_timeline.json" WithModelName:@"Microblog" WithParseNode:@"statuses"]autorelease];
        
        RequestUrlModel * cRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/statuses/user_timeline.json" WithModelName:@"Microblog" WithParseNode:@"statuses"]autorelease];
        //@我的微博
        RequestUrlModel * dRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/statuses/mentions.json"
                                                                       WithModelName:@"Microblog" WithParseNode:@"statuses"]autorelease];
        
        //所有评论我的微博
        RequestUrlModel * eRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/comments/to_me.json"
                                                                       WithModelName:@"ToMe" WithParseNode:@"comments"]autorelease];
        //评论我的微博
        RequestUrlModel * fRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/comments/show.json"
                                                                       WithModelName:@"ToMe" WithParseNode:@"comments"]autorelease];
        
        //获取附近的人
        RequestUrlModel * gRequestUrlModel = [[[RequestUrlModel alloc]initWithKeyUrl:@"https://open.weibo.cn/2/place/nearby_users/list.json"
                                                                       WithModelName:@"User" WithParseNode:@"users"]autorelease];
        
        // 40.03 weidu 116.2052 jingdu
        
        
        NSMutableDictionary * dicList = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         aRequestUrlModel,@"https://open.weibo.cn/2/statuses/public_timeline.json",
                                         bRequestUrlModel,@"https://open.weibo.cn/2/statuses/friends_timeline.json",
                                         cRequestUrlModel,@"https://open.weibo.cn/2/statuses/user_timeline.json",
                                         dRequestUrlModel,@"https://open.weibo.cn/2/statuses/mentions.json",
                                         eRequestUrlModel,@"https://open.weibo.cn/2/comments/to_me.json",
                                         fRequestUrlModel,@"https://open.weibo.cn/2/comments/show.json",
                                         gRequestUrlModel,@"https://open.weibo.cn/2/place/nearby_users/list.json",
                                         nil];

       requestUrlToModel = [[RequestUrlToModel alloc]initWithRequestUrlModel:dicList];
    }
    return requestUrlToModel;
}

-(id)initWithRequestUrlModel:(NSMutableDictionary *)requestUrlModel{
    if (self = [super init]) {
        self.dicList = requestUrlModel;
    }
    return self;
}


@end
