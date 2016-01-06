//
//  WPADViewController.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/28.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPADViewController.h"
#import "WPMainTabBarController.h"

@interface WPADViewController(){
    /** 背景图片框*/
    UIImageView *_backgroundImgView;
    /** 广告显示图片框*/
    UIImageView *_adImgView;
}
@end


@implementation WPADViewController


- (void)viewDidLoad{

    [super viewDidLoad];
    
    
    /** 初始化背景图片框，设置背景图片*/
    _backgroundImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    
    [self.view addSubview:_backgroundImgView];
    
    _backgroundImgView.frame = self.view.bounds;
    
    /**
     *初始化图片框，设置广告图片。
     */
    _adImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad"]];
    [self.view addSubview:_adImgView];
    _adImgView.centerX = self.view.centerX;
    _adImgView.centerY = self.view.height * 0.4;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        /** 创建主控制器*/
        WPMainTabBarController *mainTabBarVC = [[WPMainTabBarController alloc] init];
        /** 将主控器期设置为根控制器*/
        window.rootViewController = mainTabBarVC;
        
        
    });
    
    
    
}

@end
