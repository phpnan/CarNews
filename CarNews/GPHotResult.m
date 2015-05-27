//
//  GPHotResult.m
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPHotResult.h"
#import "GPCarDetail.h"
@implementation GPHotResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"t2":@"GPCarDetail",
             @"t3":@"GPCarDetail",
             @"t4":@"GPCarDetail",
             @"t8":@"GPCarDetail",
             @"t7":@"GPCarDetail",
             };
}
@end
