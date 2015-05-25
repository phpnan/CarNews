//
//  NSDictionary+Ext.m
//  NetWork
//
//  Created by chengxun on 15/5/7.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "NSDictionary+Ext.h"

@implementation NSDictionary (Ext)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSArray *allKeys = [self allKeys];
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [str appendString:@"}"];
    
    return str;
}
@end
