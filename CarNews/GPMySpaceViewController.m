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
#import "GPLoginController.h"
#import "MBProgressHUD+NJ.h"
@interface GPMySpaceViewController ()<GPSpaceHeaderViewDelegate>

@end

@implementation GPMySpaceViewController

#pragma mark SpaceHeaderView的代理方法

- (void)spaceHeaderView:(GPSpaceHeaderView *)spaceHeaderView
{
    GPLoginController * loginController = [[GPLoginController alloc]init];
    
    loginController.title = @"用户登录";
    
    
    [self.navigationController showViewController:loginController sender:nil];
}

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
    GPSpaceHeaderView * spaceHeaderView =[GPSpaceHeaderView spaceHeaderView];
    spaceHeaderView.delegate = self;
    self.tableView.tableHeaderView = spaceHeaderView ;
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
    
    [self.navigationController showViewController:settingController sender:nil];
}

- (void)addGroup
{
    GPSettingGroup * group = [[GPSettingGroup alloc]init];
    

    GPSettingItem * myFavo = [GPArrowItem settingItemWithIcon:@"myFavo" andTitle:@"我的收藏" andVcTargetClass:[GPMyFavoController class]];
    
    GPSettingItem * myForum = [GPArrowItem settingItemWithIcon:@"myForum" andTitle:@"我的论坛" andVcTargetClass:[GPLoginController class]];
    
    
    GPSettingItem * myOrder = [GPArrowItem settingItemWithIcon:@"myOrder" andTitle:@"购车优惠" andVcTargetClass:nil];
    myOrder.option = ^{
        
        [MBProgressHUD showMessage:@"没有关注车辆,没有优惠信息"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
        
    };
#warning 这两个跳转控制器的请求无法解析,就先封闭吧
    GPSettingItem * myNews = [GPArrowItem settingItemWithIcon:@"myNews" andTitle:@"我的通知" andVcTargetClass:nil];
    GPSettingItem * drawlots = [GPArrowItem settingItemWithIcon:@"drawlots" andTitle:@"北京摇号" andVcTargetClass:nil];
    
    group.settingItem = @[myFavo,myForum,myOrder,myNews,drawlots];
    
    [self.data addObject:group];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


@end
