//
//  GPNewsCell.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPNew;
@interface GPNewsCell : UITableViewCell
@property (nonatomic,strong)GPNew * myNew;
+(instancetype)newsCellWith:(UITableView*)tableView;

@end
