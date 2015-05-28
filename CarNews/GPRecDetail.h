//
//  GPRecDetail.h
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPRecDetail : NSObject
@property (nonatomic,assign)BOOL isElite;
@property (nonatomic,assign)BOOL isTop;
@property (nonatomic,copy) NSString * topicId;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * nickName;
@property (nonatomic,assign)NSInteger clickCount;
@property (nonatomic,assign)NSInteger replayCount;
@property (nonatomic,copy) NSString * barName;
@property (nonatomic,assign)NSInteger bid;
@property (nonatomic,copy) NSString * threadType;

@end
