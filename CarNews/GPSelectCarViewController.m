//
//  GPSelectCarViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSelectCarViewController.h"

@interface GPSelectCarViewController ()

@end

@implementation GPSelectCarViewController
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
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
