//
//  NSArray+Ext.m
//  数组
//
//  Created by qianfeng on 15-4-21.
//  Copyright (c) 2015年 TNT. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray (Ext)
#pragma mark 使得数组中打印出的是中文

- (NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString * str = [NSMutableString stringWithFormat:@"(\n"];
    for(id obj in self)
    {
        [str appendFormat:@"\t%@,\n",obj];
    }
    [str appendString:@")"];
    return str;
}
@end
