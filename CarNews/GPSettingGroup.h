//
//  GPSettingGroup.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPSettingGroup : NSObject
/**
 *  组的头文字
 */
@property (nonatomic,copy) NSString * header;
/**
 *  组的尾文字
 */
@property (nonatomic,copy) NSString * footer;
/**
 *  具体的SettingItem
 */
@property (nonatomic,strong)NSArray * settingItem;
@end
