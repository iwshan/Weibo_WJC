//
//  RequestUrlToModel.h
//  Weibo_WJC
//
//  Created by Ibokan on 13-3-13.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUrlToModel : NSObject

@property(nonatomic,retain)NSMutableDictionary * dicList;

+(RequestUrlToModel *)shareRequestUrlToModel;
-(id)initWithRequestUrlModel:(NSMutableDictionary *)requestUrlModel;

@end
