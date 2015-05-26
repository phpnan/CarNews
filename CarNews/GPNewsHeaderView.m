//
//  GPNewsHeaderView.m
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPNewsHeaderView.h"
#import "SDCycleScrollView.h"
#import "GPNews.h"
#import "GPNew.h"
@interface GPNewsHeaderView()
@property (nonatomic,weak)SDCycleScrollView * cycleScrollView;
@end
@implementation GPNewsHeaderView

+ (instancetype)newsHeaderView
{
    return [[self alloc]initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        /**
         *  添加循环轮播
         */
        SDCycleScrollView * cycleScrollView = [[SDCycleScrollView alloc]init];
        
        [self addSubview:cycleScrollView];
        
        self.cycleScrollView = cycleScrollView;
        
        self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        self.cycleScrollView.autoScrollTimeInterval = 2.0;
    }
    return self;
}

- (void)setNews:(GPNews *)news
{
    _news = news;
    NSMutableArray * urlArray = [NSMutableArray array];
    NSMutableArray * titleArray = [NSMutableArray array];
    for(GPNew * new in news.RESULT)
    {
        NSURL * header_img_url = [NSURL URLWithString:new.header_img_url];
        [urlArray addObject:header_img_url];
        NSString * title = new.title;
        [titleArray addObject:title];
    }
    
    self.cycleScrollView.imageURLsGroup = urlArray;
    
    self.cycleScrollView.titlesGroup = titleArray;
}
/**
 *  设置cycleScrollView的frame
 */
- (void)layoutSubviews
{

    self.cycleScrollView.frame = CGRectMake(0, 0,GP_SCREEN_W,200);
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, 0, GP_SCREEN_W, 200);
}




@end
