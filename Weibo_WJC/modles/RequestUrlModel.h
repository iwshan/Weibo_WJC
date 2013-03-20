//
//  RequestUrlModel.h
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-14.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUrlModel : NSObject

@property(nonatomic,retain)NSString * keyUrl;
@property(nonatomic,retain)NSString * modelName;
@property(nonatomic,retain)NSString * parseNode;

-(id)initWithKeyUrl:(NSString *)keyUrl WithModelName:(NSString*)modelName WithParseNode:(NSString *)parseName;

@end
