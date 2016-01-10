//
//  WPMainViewController.m
//  WPNTES
//
//  Created by 王鹏 on 15/12/29.
//  Copyright © 2015年 wangpeng. All rights reserved.
//

#import "WPMainViewController.h"
#import "WPChannel.h"


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
    WPLog(@"%@",self.channelList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
