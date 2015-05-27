//
//  GPRefreshView.h
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#warning 暂时还没有用上,留着备用
@interface GPRefreshView : UIView
@property (nonatomic,weak)UILabel * refreshLabel;
@property (nonatomic,weak)UIActivityIndicatorView * activity;
+ (instancetype)refreshView;
@end
