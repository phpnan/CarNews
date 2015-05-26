//
//  GPNewsHeaderView.h
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPNews;
@interface GPNewsHeaderView : UIView
@property (nonatomic,strong)GPNews * news;

+ (instancetype)newsHeaderView;

@end
