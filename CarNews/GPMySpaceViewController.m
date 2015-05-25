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
#import "GPSpaceHeaderView.h"
#import "GPSettingController.h"
@interface GPMySpaceViewController ()

@end

@implementation GPMySpaceViewController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStylePlain];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if(self = [super initWithStyle:style])
    {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  添加头部
     */
    self.tableView.tableHeaderView = [GPSpaceHeaderView spaceHeaderView];
    /**
     *  让分割线消失
     */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(settingTouch)];
    
 
    [self addGroup];
}

- (void)settingTouch
{
    GPSettingController * settingController = [[GPSettingController alloc]init];
    settingController.title = @"更多";
//    settingController.navigationItem.leftBarButtonItem.title = nil;
    [self.navigationController showViewController:settingController sender:nil];
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