//
//  GPDetailFooterView.m
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPDetailFooterView.h"
@interface GPDetailFooterView()
@property (nonatomic,weak)UIButton * shareBtn;
@property (nonatomic,weak)UIButton * commentBtn;
@end
@implementation GPDetailFooterView

+ (instancetype)detailFooterView
{
    return [[self alloc]init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setUpCommentBtn];
        
        [self setUpShareBtn];
    
    }
    return self;
}

- (void)setUpCommentBtn
{
    UIButton * commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [commentBtn setBackgroundImage:[UIImage imageNamed:@"pinglun"] forState:UIControlStateNormal];
    
    [self addSubview:commentBtn];
    
    self.commentBtn = commentBtn;
    
    [self.commentBtn addTarget:self action:@selector(commentBtnTouch:) forControlEvents:UIControlEventTouchDown];
}

- (void)commentBtnTouch:(UIButton*)commentBtn
{
    GPLog(@"点击了评论按键");
}

- (void)setUpShareBtn
{
    UIButton * ShareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ShareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    
    [self addSubview:ShareBtn];
    
    self.shareBtn = ShareBtn;
    
    [self.shareBtn addTarget:self action:@selector(shareBtnTouch:) forControlEvents:UIControlEventTouchDown];
   
}

#warning 分享按钮

- (void)shareBtnTouch:(UIButton*)shareBtn
{
    GPLog(@"点击了分享按键");
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.shareBtn.frame = CGRectMake(250,7, 30, 30);
    
    self.commentBtn.frame = CGRectMake(320, 7, 30, 30);
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, GP_SCREEN_H-44-64, GP_SCREEN_W, 44);
}

@end
