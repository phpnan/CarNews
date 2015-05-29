//
//  GPSpaceHeaderView.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSpaceHeaderView.h"
#import "GPLoginController.h"
#import "GPBaseNaviController.h"
@implementation GPSpaceHeaderView
+ (instancetype)spaceHeaderView
{
    return [[NSBundle mainBundle]loadNibNamed:@"GPSpaceHeaderView" owner:nil options:nil][0];
    
}

- (IBAction)loginTouch:(UIButton *)sender {
    [_delegate spaceHeaderView:self];
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, 0, GP_SCREEN_W, 300);
}

//- (void)didMoveToSuperview
//{
//    self.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
//    NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
//    
//    NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:self.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>]
//}

@end
