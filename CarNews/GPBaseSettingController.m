//
//  GPBaseSettingController.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPBaseSettingController.h"
#import "GPSettingGroup.h"
#import "GPSettingItem.h"
#import "GPSettingCell.h"
//#import "GPMyFavoController.h"
#import "GPArrowItem.h"
#import "GPSwitchCityController.h"
@interface GPBaseSettingController ()

@end

@implementation GPBaseSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  所有继承了这个类的设置选项的弹簧都被关闭了
     */
    self.tableView.bounces  = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSMutableArray*)data
{
    if(_data == nil)
    {
        _data = [NSMutableArray array];
        
    }
    return _data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /**
     *  设置每一组中item的个数
     */
    GPSettingGroup * group = self.data[section];
    
    return group.settingItem.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     这里需要自定义cell
     */
    static NSString * ID = @"settingCell";
    
    GPSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[GPSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    GPSettingGroup * group = self.data[indexPath.section];
    
    GPSettingItem * item = group.settingItem[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  一旦选中就取消选中,有控制器跳转的就跳转控制器
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GPSettingGroup * group = self.data[indexPath.section];
    GPSettingItem * item = group.settingItem[indexPath.row];
    
    if(item.option)
    {
        item.option();
    }
    
    
    if([item isKindOfClass:[GPArrowItem class]])
    {
        
        GPArrowItem * arrowItem = (GPArrowItem*)item;
        
       
        /**
         *  存在下一个控制器才跳转,也是在这里给下一个控制器穿这个模型的数据
         */
        if(arrowItem.vcTargetClass)
        {
            UIViewController * controller = [[arrowItem.vcTargetClass alloc]init];
            if([controller isKindOfClass:[GPSwitchCityController class]])
            {
                   //GPLog(@"%s%p",__func__,controller);
                GPSwitchCityController * switchCityController = (GPSwitchCityController*)controller;
               
                __block typeof (arrowItem)substitute = arrowItem;
//                GPLog(@"%p",arrowItem);
//                GPLog(@"%p",substitute);
                [arrowItem setArrowOption:^(NSString *cityName) {
                    substitute.detail = cityName;
                    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }];
                
                switchCityController.arrowItem = arrowItem;
                
            }
            
        
            
            controller.title = arrowItem.title;

            controller.view.backgroundColor = [UIColor whiteColor];
            
            [self.navigationController pushViewController:controller animated:YES];
        }
       
    }
    
}


@end
