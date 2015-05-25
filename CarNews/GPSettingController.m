//
//  GPSettingController.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSettingController.h"
#import "GPSettingGroup.h"
#import "GPSettingItem.h"
#import "GPArrowItem.h"
#import "MBProgressHUD+NJ.h"
@interface GPSettingController ()

@end

@implementation GPSettingController
- (instancetype)init
{
    //GPLog(@"init");
//    self.navigationItem.backBarButtonItem.title = nil;
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if(self = [super initWithStyle:style])
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    //GPLog(@"viewDidload");
    [super viewDidLoad];
    
    [self addGroup];
    [self addGroup2];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addGroup
{
    
#warning 这里要设置下一步跳转的控制器以及一些block的操作
    
    GPSettingGroup * group = [[GPSettingGroup alloc]init];
    GPSettingItem * switchCity =
    [GPArrowItem settingItemWithIcon:nil andTitle:@"切换城市"];
    
    GPSettingItem * checkUpdate = [GPArrowItem settingItemWithIcon:nil andTitle:@"检查新版本"  anddetailTitle:@"当前版本Beta4.3.2" andVcTargetClass:nil];
    
    checkUpdate.option = ^{
        [MBProgressHUD showMessage:@"正在检查新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"当前版本是最新版本"];
        });
    };
    
    
    GPSettingItem * removeCache = [GPSettingItem settingItemWithIcon:nil andTitle:@"清除缓存" anddetailTitle:@"0.00M"];
    removeCache.option = ^{
        [MBProgressHUD showSuccess:@"没有缓存无需清理"];
    };
    
    
    GPSettingItem * suggest = [GPArrowItem settingItemWithIcon:nil andTitle:@"意见反馈"];
    
    group.settingItem = @[switchCity,checkUpdate,removeCache,suggest];
    
    [self.data addObject:group];
}

- (void)addGroup2
{
    GPSettingGroup * group = [[GPSettingGroup alloc]init];
    GPSettingItem * like = [GPArrowItem settingItemWithIcon:nil andTitle:@"喜欢,就给个好评吧"];
    GPSettingItem * share = [GPArrowItem settingItemWithIcon:nil andTitle:@"分享给好友"];
    GPSettingItem * advice = [GPArrowItem settingItemWithIcon:nil andTitle:@"应用推荐"];
    group.settingItem = @[like,share,advice];
    [self.data addObject:group];
}
#warning 似乎只是修改了第一个section的header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//
//{
//    return 10;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
