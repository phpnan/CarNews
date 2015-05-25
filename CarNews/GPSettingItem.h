//
//  GPSettingItem.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^GPSettingItemOption)();
@interface GPSettingItem : NSObject

@property (nonatomic,copy) NSString * icon;

@property (nonatomic,copy) NSString * title;

@property (nonatomic,copy) NSString * detail;

@property (nonatomic,copy) GPSettingItemOption option;

+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title;
+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title anddetailTitle:(NSString*)detail;
@end
