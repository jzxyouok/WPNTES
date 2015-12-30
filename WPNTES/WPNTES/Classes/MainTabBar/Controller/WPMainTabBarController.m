//
//  WPMainTabBarController.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/28.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPMainTabBarController.h"
#import "WPMainViewController.h"
#import "WPReadingTableViewController.h"
#import "WPDiscoverTableViewController.h"
#import "WPVideoViewController.h"
#import "WPMeViewController.h"
@interface WPMainTabBarController ()

@end

@implementation WPMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addChildViewController];
}


#pragma mark -- 统一添加子控制器
- (void)addChildViewController{
    [self addChildViewController:[[WPMainViewController alloc] init] title:@"新闻"];
    [self addChildViewController:[[WPReadingTableViewController alloc]init] title:@"阅读"];
    [self addChildViewController:[[WPDiscoverTableViewController alloc] init] title:@"发现"];
    [self addChildViewController:[[WPVideoViewController alloc] init] title:@"视听"];
    [self addChildViewController:[[WPMeViewController alloc] init] title:@"我"];
     
    

}

/** 添加navigationController控制器*/
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title  {
    
    vc.title = title;
//    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
