//
//  GPCity.h
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPCity : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * initial;

- (instancetype)initWithDict:(NSDictionary*)dict;
+ (instancetype)cityWithDict:(NSDictionary*)dict;
@end
