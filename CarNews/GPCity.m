//
//  GPCity.m
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPCity.h"

@implementation GPCity
- (instancetype)initWithDict:(NSDictionary*)dict
{
    if(self = [super init])
    {
        self.name = dict[@"name"];
        self.initial = dict[@"initial"];
    }
    return self;
}
+ (instancetype)cityWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
