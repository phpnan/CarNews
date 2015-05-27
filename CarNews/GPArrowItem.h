//
//  GPArrowItem.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSettingItem.h"
/**
 *  定义一个回传name的block
 *
 *  @param cityName <#cityName description#>
 */
typedef void(^GPArrowItemOption)(NSString*cityName);
@interface GPArrowItem : GPSettingItem
/**
 *  添加了跳转控制器的属性
 */
@property (nonatomic,assign)Class vcTargetClass;
@property (nonatomic,copy) GPArrowItemOption arrowOption;
+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title andVcTargetClass:(Class)vcTargetClass;
+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title anddetailTitle:(NSString*)detail andVcTargetClass:(Class)vcTargetClass;

- (void)setArrowOption:(GPArrowItemOption)arrowOption;

@end
