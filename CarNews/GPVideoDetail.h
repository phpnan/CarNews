
//  GPVideoDetail.h
//  CarNews
//
//  Created by chengxun on 15/5/29.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPVideoDetail : NSObject
@property (nonatomic,assign)NSInteger replyCount;
@property (nonatomic,copy) NSString * mp4Hd_url;
@property (nonatomic,copy) NSString * cover;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * replyBoard;
@property (nonatomic,assign)NSInteger playCount;

@property (nonatomic,copy) NSString * replyid;

@property (nonatomic,copy) NSString * mp4_url;

@property (nonatomic,assign)NSInteger length;

@property (nonatomic,assign)NSInteger playersize;

@property (nonatomic,copy) NSString * m3u8Hd_url;

@property (nonatomic,copy) NSString * m3u8_url;

@property (nonatomic,copy) NSString * ptime;

@property (nonatomic,copy) NSString * vid;
@end
