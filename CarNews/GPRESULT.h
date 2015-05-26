//
//  GPRESULT.h
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPRESULT : NSObject
@property (nonatomic,copy) NSString * author;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * atricle_id;
@property (nonatomic,copy) NSString * source;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,strong)NSArray * sub_pages;
@property (nonatomic,copy) NSString * pcurl;
@property (nonatomic,copy) NSString * modelIds;
@property (nonatomic,copy) NSString * header_img_url;
@property (nonatomic,copy) NSString * date;
@property (nonatomic,copy) NSString * entity_id;
@property (nonatomic,copy) NSString * brief;

@end
