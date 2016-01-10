//
//  WPChannel.h
//  WPNTES
//
//  Created by 王鹏 on 16/1/10.
//  Copyright © 2016年 wangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPChannel : NSObject
/** 新闻类别*/
@property (copy, nonatomic) NSString *tname;
/** 新闻ID*/
@property (copy, nonatomic) NSString *tid;

+ (instancetype)channelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
