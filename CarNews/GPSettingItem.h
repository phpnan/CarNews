//
//  GPSettingItem.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPSettingItem : NSObject

@property (nonatomic,copy) NSString * icon;

@property (nonatomic,copy) NSString * title;



+ (instancetype)settingItemWithIcon:(NSString*)icon andTitle:(NSString*)title;

@end
