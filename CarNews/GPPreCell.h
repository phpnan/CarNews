//
//  GPPreCell.h
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPListDetail;
@interface GPPreCell : UICollectionViewCell
@property (nonatomic,strong)GPListDetail * listDetail;
+ (instancetype)preCellWith:(UICollectionView*)collectionView andIndexPath:(NSIndexPath*)indexPath;
@end
