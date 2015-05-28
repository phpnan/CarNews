//
//  GPRecomend.m
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPRecomend.h"
#import "GPRecDetail.h"
@implementation GPRecomend
+ (NSDictionary *)objectClassInArray
{
    return @{@"RESULT":@"GPRecDetail",
             };
}
@end
