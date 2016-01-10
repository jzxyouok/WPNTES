//
//  WPBottomTabBar.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/29.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPBottomTabBar.h"
#import "WPBottomTabBarButton.h"


@interface WPBottomTabBar ()
/** 记录当前被选中的Button*/
@property (weak, nonatomic)UIButton *selectedButton;
@end



@implementation WPBottomTabBar

#pragma mark -- 创建按钮，实现按钮的监听点击方法
/**
 *实现一个方法通过传入两张图片，添加底部的bottomTabBarButton的方法
 */
- (void)addButtomTabBarButtonWithImageName:(NSString *)normal selected:(NSString *)selected{
    
    /** 创建按钮*/
    WPBottomTabBarButton *bottomTabBarButton = [[WPBottomTabBarButton alloc] init];
    /** 设置默认状态显示图片*/
    [bottomTabBarButton setImage:
             [UIImage imageNamed:normal]
                        forState:UIControlStateNormal];
    /** 设置选中状态图片*/
    [bottomTabBarButton setImage:
             [UIImage imageNamed:selected]
                        forState:UIControlStateSelected];
    /** 将按钮添加入底部tabBar上*/
    [self addSubview:bottomTabBarButton];
    
    /** 添加按钮监听点击时间*/
    [bottomTabBarButton addTarget:self
                           action:@selector(didClickButtomTabBarButton:)
                 forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 *tabBarButton的监听事件
 */
- (void)didClickButtomTabBarButton:(WPBottomTabBarButton *)button{

    /** 当前被选中按钮状态变为NO*/
    self.selectedButton.selected = NO;
    
    /** 传入Button选中状态变为YES*/
    button.selected = YES;
    
    /** 记录传入的选中按钮*/
    self.selectedButton = button;
    
    /** 记录当前被点击按钮的索引*/
    int index = (int)button.tag;
    
    /** 判断是否实现代理方法*/
    if ([self.delegate respondsToSelector:@selector(bottomTabBar:didClickButtomTabBarWithIndex:)]) {
        
        /** 实现代理方法*/
        [self.delegate bottomTabBar:self didClickButtomTabBarWithIndex:index];
    }
    
}
#pragma mark -- 对子控件布局
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    /** 获取总按钮的长度*/
    NSUInteger count = self.subviews.count;
    
    /** 设置frame*/
    CGFloat width = self.width / count;
    CGFloat height = self.height;
    CGFloat y = 0;
    
    for (int i = 0; i < count; i++) {
        
        /** 计算X坐标*/
        CGFloat x = i * width;
        
        /** 循环取出子控件*/
        WPBottomTabBarButton *button = self.subviews[i];
        
        /** 设置frame*/
        button.frame = CGRectMake(x, y, width, height);
        
        /** 设置buttomTabBarButton的tag*/
        button.tag = i;
        
        /** 设置默认为第0个按钮被选中*/
        if (i == 0) {
            
            button.selected = YES;
            
            self.selectedButton = button;
        }
        
    }

}

@end
