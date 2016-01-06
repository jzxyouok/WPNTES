//
//  WPMainTabBarController.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/28.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPMainTabBarController.h"
#import "WPBaseNavigationController.h"
#pragma mark -- 导入子控制器头文件
#import "WPMainViewController.h"
#import "WPReadingTableViewController.h"
#import "WPDiscoverTableViewController.h"
#import "WPVideoViewController.h"
#import "WPMeViewController.h"

#pragma mark -- 导入底部按钮头文件
#import "WPBottomTabBar.h"
@interface WPMainTabBarController ()<WPBottomTabBarDelegate>

@end

@implementation WPMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
}        


#pragma mark -- 统一添加子控制器
/**
 *统一添加子控制器
 */
- (void)setupChildViewControllers{

    /** 新闻中心*/
    WPBaseNavigationController *navMain = [self navigationControllerWithStroyboardName:@"Main"];
    /** 阅读中心*/
    WPBaseNavigationController *navRead = [self navigationControllerWithStroyboardName:@"Read"];
    /** 视听中心*/
    WPBaseNavigationController *navVideo = [self navigationControllerWithStroyboardName:@"Video"];
    /** 发现中心*/
    WPBaseNavigationController *navDiscover = [self navigationControllerWithStroyboardName:@"Discover"];
    /** 关于我*/
    WPBaseNavigationController *navMe = [self navigationControllerWithStroyboardName:@"Me"];
    self.viewControllers = @[navMain, navRead, navVideo, navDiscover, navMe];
}

- (WPBaseNavigationController *)navigationControllerWithStroyboardName:(NSString *)name{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    /** 设置为初始化控制器*/
    return [storyboard instantiateInitialViewController];

}
#pragma mark -- 设置自定义底部tabBar
/**
 *设置自定义Tabbar
 */
- (void)setupCustomTabBar{

    /** 创建自定义TabBar*/
    WPBottomTabBar *bottomTabBar = [[WPBottomTabBar alloc] init];
    
    
    
    /** 通过循环来给bottomTabBar中按钮赋值*/
    NSUInteger count = self.viewControllers.count;
    
    for (int i = 0; i < count; i++) {
        
        /** 拼接默认状态图片名*/
        NSString *nonmal = [NSString stringWithFormat:@"TabBar%d", i + 1];
        /** 拼接选中状态图片名*/
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        /** 设置bottomTabBarButton显示图片*/
        [bottomTabBar addButtomTabBarButtonWithImageName:nonmal selected:selected];
        
    }

    //设置Bottom的frame
    bottomTabBar.frame = self.tabBar.bounds;
    
    
    [self.tabBar insertSubview:bottomTabBar aboveSubview:self.tabBar];
    
    /** 遵守代理协议*/
    bottomTabBar.delegate = self;
    
}

#pragma mark -- 实现代理协议
/**
 *BottomTabBar代理协议
 */
- (void)bottomTabBar:(WPBottomTabBar *)bottomTabBar didClickButtomTabBarWithIndex:(int)index{

    self.selectedIndex = index;
    
    NSLog(@"%zd", self.selectedIndex);
    
    
}
@end
