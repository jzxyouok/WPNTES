//
//  UIView+WPCategory.h
//  WPNTES
//
//  Created by 王鹏 on 15/12/28.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WPCategory)
/** 获取对象的X点坐标*/
@property (assign, nonatomic)CGFloat x;
/** 获取对象的Y点坐标*/
@property (assign, nonatomic)CGFloat y;
/** 获取对象的宽*/
@property (assign, nonatomic)CGFloat width;
/** 获取对象的高*/
@property (assign, nonatomic)CGFloat height;
/** 获取对象的X，Y坐标*/
@property (assign, nonatomic)CGPoint origin;
/** 获取对象的宽和高*/
@property (assign, nonatomic)CGSize size;
/** 获取对象的中心点X坐标*/
@property (assign, nonatomic)CGFloat centerX;
/** 获取对象的中心点X坐标*/
@property (assign, nonatomic)CGFloat centerY;
@end
