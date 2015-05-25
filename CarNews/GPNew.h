//
//  GPNew.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPNew : NSObject
@property (nonatomic,copy) NSString * ID;
@property (nonatomic,copy) NSString * createTime;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * header_img_url;
@property (nonatomic,copy) NSString * commentCount;
@property (nonatomic,copy) NSString * brief;
@end
