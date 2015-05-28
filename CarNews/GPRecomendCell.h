//
//  GPRecomendCell.h
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPRecDetail;
@interface GPRecomendCell : UITableViewCell
@property (nonatomic,strong)GPRecDetail * recDetail;
+ (instancetype)recomendCellWith:(UITableView*)tableView;
@end
