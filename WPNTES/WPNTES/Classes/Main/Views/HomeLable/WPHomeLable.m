//
//  WPHomeLable.m
//  WPNTES
//
//  Created by 王鹏 on 16/1/10.
//  Copyright © 2016年 wangpeng. All rights reserved.
//

#import "WPHomeLable.h"
/** lable最小缩放比*/
#define MinWHScale 0.6
@implementation WPHomeLable

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        /** lable居中显示*/
        self.textAlignment = NSTextAlignmentCenter;
        /** lable默认文字大小*/
        self.font = [UIFont systemFontOfSize:20];
        /** 允许lable与用户交互*/
        self.userInteractionEnabled = YES;
        /** 设置默认比例是0*/
        _scale = 0.0;
    }
    return self;
}

- (void)setScale:(CGFloat)scale{

    _scale = scale;
    /** 文本框中文字渐变颜色*/
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1.0];
    /** 文本框大小渐变*/
    CGFloat whScale = MinWHScale + scale * (1 - MinWHScale);
    self.transform = CGAffineTransformMakeScale(whScale, whScale);
}
@end
