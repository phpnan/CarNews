//
//  GPBaseTabController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPBaseTabController.h"
#import "GPNewsViewController.h"
#import "GPSelectCarViewController.h"
#import "GPBaseNaviController.h"
#import "GPPreferentialViewController.h"
#import "GPForumViewController.h"
#import "GPMySpaceViewController.h"


@interface GPBaseTabController ()

@end

@implementation GPBaseTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     添加首页资讯控制器
     */
    UIViewController * newsViewController = [[GPNewsViewController alloc]init];
    [self addChildController:newsViewController withTitle:@"资讯" withImageName:@"tab_news_normal" andSelectImage:@"tab_news_highlighted"];
    /**
     添加找车控制器
     */
    UIViewController * selectCarController = [[GPSelectCarViewController alloc]init];
    [self addChildController:selectCarController withTitle:@"视频" withImageName:@"tab_selectCar_normal" andSelectImage:@"tab_selectCar_highlighted"];
    /**
     添加特惠控制器
     */
    UIViewController * preferentialController = [[GPPreferentialViewController alloc]init];
    /**
     *  添加论坛控制器
     */
    [self addChildController:preferentialController withTitle:@"故事" withImageName:@"tab_preferentialCar_normal" andSelectImage:@"tab_preferentialCar_highlighted"];
    UIViewController * forumController = [[GPForumViewController alloc]init];
    [self addChildController:forumController withTitle:@"论坛" withImageName:@"tab_forum_normal" andSelectImage:@"tab_forum_highlighted"];
    /**
     *  添加我的控制器
     */
    UIViewController * myspaceController = [[GPMySpaceViewController alloc]init];
    [self addChildController:myspaceController withTitle:@"我的" withImageName:@"tab_mySpace_normal" andSelectImage:@"tab_mySpace_highlighted"];
    
}

/**
 *  添加包装好的tabBarcontroller的childViewController
 *
 *  @param viewController 传进来的controller
 *  @param title          这个controller的标题
 *  @param name           底部tabBar的normal的图片
 *  @param selectedName   选中后tabBar的selected图片
 */
- (void)addChildController:(UIViewController*)viewController withTitle:(NSString*)title withImageName:(NSString*)name andSelectImage:(NSString*)selectedName
{
   
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:name];
    viewController.tabBarItem.selectedImage = [UIImage imageRendering:selectedName];
    
    GPBaseNaviController * navi = [[GPBaseNaviController alloc]initWithRootViewController:viewController];
    [self addChildViewController:navi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
