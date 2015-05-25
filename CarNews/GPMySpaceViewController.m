//
//  GPMySpaceViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPMySpaceViewController.h"
#import "GPSettingGroup.h"
#import "GPSettingItem.h"
#import "GPSettingCell.h"
#import "GPMyFavoController.h"
#import "GPArrowItem.h"
@interface GPMySpaceViewController ()

@end

@implementation GPMySpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  添加一个headerView
     */
   // self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self addGroup];
}

- (void)addGroup
{
    GPSettingGroup * group = [[GPSettingGroup alloc]init];
#warning 在这里设置我们要跳转的控制器
    GPSettingItem * myFavo = [GPArrowItem settingItemWithIcon:@"myFavo" andTitle:@"我的收藏" andVcTargetClass:[GPMyFavoController class]];
    
    GPSettingItem * myForum = [GPArrowItem settingItemWithIcon:@"myForum" andTitle:@"我的论坛" andVcTargetClass:[GPMyFavoController class]];
    GPSettingItem * myOrder = [GPArrowItem settingItemWithIcon:@"myOrder" andTitle:@"购车优惠" andVcTargetClass:[GPMyFavoController class]];
    GPSettingItem * myNews = [GPArrowItem settingItemWithIcon:@"myNews" andTitle:@"我的通知" andVcTargetClass:[GPMyFavoController class]];
    GPSettingItem * drawlots = [GPArrowItem settingItemWithIcon:@"drawlots" andTitle:@"北京摇号" andVcTargetClass:[GPMyFavoController class]];
    
    group.settingItem = @[myFavo,myForum,myOrder,myNews,drawlots];
    
    [self.data addObject:group];
}


@end
