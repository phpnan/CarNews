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

@end
