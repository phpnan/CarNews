//
//  GPHotCar.h
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GPHotResult;
@interface GPHotCar : NSObject

@property (nonatomic,copy) NSString * STATUS;
@property (nonatomic,strong)GPHotResult * RESULT;

@end
