//
//  GPSettingItem.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSettingItem.h"

@implementation GPSettingItem

+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title
{
    GPSettingItem * item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title anddetailTitle:(NSString*)detail
{
    GPSettingItem * item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    item.detail = detail;
    return item;
}
@end
