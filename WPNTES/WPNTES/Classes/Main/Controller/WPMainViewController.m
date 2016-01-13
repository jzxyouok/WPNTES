//
//  WPMainViewController.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/29.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPMainViewController.h"
#import "WPChannel.h"
#import "WPSocietyTableViewController.h"
#import "WPHeadlineTableViewController.h"
#import "WPHomeLable.h"
@interface WPMainViewController ()
/** 标题ScrollView*/
@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
/** 内容ScrollView*/
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
/** 模型数据*/
@property (strong, nonatomic) NSArray *channelList;

@end

@implementation WPMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildsViewController];
    [self setupTitles];
    
}

#pragma mark -- 添加子控制器及标题设置
/**
 * 添加子控制器
 */
- (void)setupChildsViewController{

    /** 新闻控制器*/
    UIStoryboard *headlineSB = [UIStoryboard storyboardWithName:@"Headline" bundle:nil];
    WPHeadlineTableViewController *headlineVC = [headlineSB instantiateViewControllerWithIdentifier:@"Headline"];
    /** 传递url*/
    headlineVC.urlString = [self.channelList[0]tid];
    /** 标题*/
    headlineVC.title = [self.channelList[0]tname];
    /** 添加子控制器*/
    [self addChildViewController:headlineVC];
    
    /** 社会控制器*/
    UIStoryboard *societySB = [UIStoryboard storyboardWithName:@"Society" bundle:nil];
    WPSocietyTableViewController *societyVC = [societySB instantiateViewControllerWithIdentifier:@"Society"];
    /** 传递url*/
    societyVC.urlString = [self.channelList[1]tid];
    /** 标题*/
    societyVC.title = [self.channelList[2]tname];
    /** 添加子控制器*/
    [self addChildViewController:societyVC];
    
    
    /** 循环创建子控制器*/
    int count = (int)self.channelList.count - 2;
    for (int i = 0; i < count; i++) {
        
        UIViewController *vc = [[UIViewController alloc] init];
        /** 取出标题*/
        vc.title = [self.channelList[i + 2] tname];
        /** 添加子控制器*/
        [self addChildViewController:vc];
        
    }
    

}

/**
 * 创建顶部标题
 */
- (void)setupTitles{

    /** 获取所有子控件的数量*/
    NSUInteger count = self.childViewControllers.count;
    /** 设置坐标*/
    CGFloat lableW = 80;
    CGFloat lableH = 30;
    CGFloat lableY = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        /** 创建lable*/
        WPHomeLable *lable = [[WPHomeLable alloc] init];
        /** 绑定tag*/
        lable.tag = i;
        /** 将标题加入titleScrollView*/
        [self.titleScrollView addSubview:lable];
        
        /** 设置frame*/
        CGFloat lableX = i * lableW;
        lable.frame = CGRectMake(lableX, lableY, lableW, lableH);
        
        /** 设置文字*/
        UIViewController *vc = self.childViewControllers[i];
        lable.text = vc.title;
        WPLog(@"%@------------%@", vc.title, lable.text);
        /** 设置lable监听点击时间*/
        [lable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableClick:)]];
        
        /** 设置scrollView的内容大小*/
        CGFloat titleContentW = count * lableW;
        self.titleScrollView.contentSize = CGSizeMake(titleContentW, 0);
    }
}


#pragma mark -- lable点击时间
- (void)lableClick:(UITapGestureRecognizer *)recognizer{
    
    /** 获取被点击的lable*/
    WPHomeLable *lable = (WPHomeLable *)recognizer.view;
    /** 计算X方向的偏移量*/
    CGFloat offsetX = lable.tag * self.contentScrollView.width;
    WPLog(@"%ld", lable.tag);
    /** 设置偏移量*/
    [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

#pragma mark -- 懒加载
- (NSArray *)channelList{

    if (_channelList == nil) {
        
        /** 加载二进制的JSON数据*/
        NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        /** 二进制数据进行JSON反序列化*/
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        /** 从字典中获取数组数据*/
        NSArray *dictArray = dict[dict.keyEnumerator.nextObject];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:10];
        /** 字典转模型*/
        for (NSDictionary *diction in dictArray) {
            
            WPChannel *channel = [WPChannel channelWithDict:diction];
            
            [arrayM addObject:channel];
        }
    
        /** 通过tid从小到达的排序*/
        _channelList = [arrayM sortedArrayUsingComparator:^NSComparisonResult(WPChannel *obj1, WPChannel *obj2) {
            return [obj1.tid compare:obj2.tid];
        }];
    }
    
    return _channelList;
}

@end
