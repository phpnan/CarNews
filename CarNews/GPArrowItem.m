//
//  GPArrowItem.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPArrowItem.h"

@implementation GPArrowItem
+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title andVcTargetClass:(Class)vcTargetClass;
{
    GPArrowItem * arrowItem = [self settingItemWithIcon:icon andTitle:title];

    
    arrowItem.vcTargetClass = vcTargetClass;
    
    return arrowItem;
}

+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title anddetailTitle:(NSString*)detail andVcTargetClass:(Class)vcTargetClass
{
    GPArrowItem * arrowItem = [self settingItemWithIcon:icon andTitle:title anddetailTitle:detail];
    arrowItem.vcTargetClass = vcTargetClass;
    return arrowItem;
}

- (void)setArrowOption:(GPArrowItemOption)arrowOption
{
    _arrowOption = [arrowOption copy];
}
@end
