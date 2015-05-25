//
//  GPNewsViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPNewsViewController.h"

@interface GPNewsViewController ()

@end

@implementation GPNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%s",__func__);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
#warning 写到这里,到现在为止依然是符合懒加载的原则的
}



/**
 *  点击搜索按钮时要调用的方法
 */
- (void)search
{
    NSLog(@"search");
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
