//
//  UIImage+GPImageRendering.h
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  使得图片保持原画的Category
 */
@interface UIImage (GPImageRendering)
+ (UIImage*)imageRendering:(NSString*)name;
@end
