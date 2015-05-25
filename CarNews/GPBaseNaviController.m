//
//  GPBaseNaviController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPBaseNaviController.h"

@interface GPBaseNaviController ()

@end

@implementation GPBaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];

}

+ (void)initialize
{
    UINavigationBar * naviBar = [UINavigationBar appearance];
    /**
     *  设置返回键上图标的颜色
     */
    naviBar.tintColor = [UIColor blackColor];
    /**
     *  设置导航栏正中title的样式和底色图片
     */
    [naviBar setBackgroundImage:[UIImage imageNamed:@"btn_yellow"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [naviBar setTitleTextAttributes:attrs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /**
     *  当栈中只有rootviewController时不推出
     */
    if(self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
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
