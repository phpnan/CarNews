//
//  GPSelectCarViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSelectCarViewController.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "GPCarDetail.h"
#import "GPHotCar.h"
#import "GPHotResult.h"
@interface GPSelectCarViewController ()
@property (nonatomic,strong)GPHotCar * hotCars;
@end

@implementation GPSelectCarViewController
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (GPHotCar*)hotCars
{
    if(_hotCars == nil)
    {
        _hotCars = [[GPHotCar alloc]init];
    }
    return _hotCars;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpSegmentControl];
    
    [self sendRequest];
}

- (void)setUpSegmentControl
{
    UISegmentedControl * segmentControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, GP_SCREEN_W, 44)];
    
    segmentControl.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = segmentControl;
}

- (void)sendRequest
{
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:GP_HOTMODEL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.hotCars = [GPHotCar objectWithKeyValues:responseObject];
        
#warning 处理整个模型,要给具体的section传递的是一个t的模型,t里面有若干数组
        [self.tableView reloadData];
        
        GPLog(@"~~~");
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    return cell;
}



@end
