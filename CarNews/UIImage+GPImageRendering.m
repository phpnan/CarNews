//
//  UIImage+GPImageRendering.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "UIImage+GPImageRendering.h"

@implementation UIImage (GPImageRendering)
+ (UIImage*)imageRendering:(NSString*)name
{
    return [[UIImage imageNamed:name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
