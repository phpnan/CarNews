//
//  GPListDetail.h
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPListDetail : NSObject
@property (nonatomic,assign)NSInteger authorId;
@property (nonatomic,copy) NSString * authorName;
@property (nonatomic,copy) NSString * barName;
@property (nonatomic,copy) NSString * bid;
@property (nonatomic,copy) NSString * desc;
@property (nonatomic,copy) NSString * imgUrl;
@property (nonatomic,assign)NSInteger replyCount;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * topicId;


@end
