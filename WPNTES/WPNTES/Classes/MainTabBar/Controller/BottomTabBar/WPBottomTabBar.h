//
//  WPBottomTabBar.h
//  WPNTES
//
//  Created by 王鹏 on 15/12/29.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WPBottomTabBar;
/**
 *代理协议
 */
@protocol WPBottomTabBarDelegate <NSObject>
@optional
- (void)bottomTabBar:(WPBottomTabBar *)bottomTabBar didClickButtomTabBarWithIndex:(int)index;
@end

@interface WPBottomTabBar : UIView

/**
 *代理协议属性
 */
@property (weak, nonatomic)id<WPBottomTabBarDelegate> delegate;
/**
 *调用此方法，传入默认状态图片和选中状态图片名。
 */
- (void)addButtomTabBarButtonWithImageName:(NSString *)normal selected:(NSString *)selected;

@end
