//
//  GPNewDetail.h
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GPRESULT;
@interface GPNewDetail : NSObject
@property (nonatomic,strong)GPRESULT * RESULT;
@property (nonatomic,copy) NSString * STATUS;
@end
