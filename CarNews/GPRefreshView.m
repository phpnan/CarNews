//
//  GPRefreshView.m
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPRefreshView.h"

@implementation GPRefreshView
+ (instancetype)refreshView
{
    return  [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UILabel * label = [[UILabel alloc]init];
        label.text = @"下拉刷新";
        [self addSubview:label];
        self.refreshLabel = label;
        
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:activity];
        self.activity = activity;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.refreshLabel.frame = CGRectMake(50, 0, GP_SCREEN_W, 44);
    self.activity.frame = CGRectMake(10, 0, 40, 44);
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, -100, GP_SCREEN_W, 44);
    self.backgroundColor = [UIColor redColor];
}
@end
