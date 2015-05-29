//
//  GPVideoCell.h
//  CarNews
//
//  Created by chengxun on 15/5/29.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPVideoDetail;
@interface GPVideoCell : UITableViewCell
@property (nonatomic,strong)GPVideoDetail * detail;
+(instancetype)videoCellWith:(UITableView*)tableView;

@end
