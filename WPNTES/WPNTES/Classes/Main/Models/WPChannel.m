//
//  WPChannel.m
//  WPNTES
//
//  Created by 王鹏 on 16/1/10.
//  Copyright © 2016年 wangpeng. All rights reserved.
//

#import "WPChannel.h"

@implementation WPChannel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)channelWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}

@end
