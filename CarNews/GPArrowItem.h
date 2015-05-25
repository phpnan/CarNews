//
//  GPArrowItem.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSettingItem.h"

@interface GPArrowItem : GPSettingItem
/**
 *  添加了跳转控制器的属性
 */
@property (nonatomic,assign)Class vcTargetClass;

+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title andVcTargetClass:(Class)vcTargetClass;
+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title anddetailTitle:(NSString*)detail andVcTargetClass:(Class)vcTargetClass;
@end
