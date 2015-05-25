//
//  GPSpaceHeaderView.h
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPSpaceHeaderView;
@protocol GPSpaceHeaderViewDelegate <NSObject>
- (void)spaceHeaderView:(GPSpaceHeaderView*)spaceHeaderView;
@end

@interface GPSpaceHeaderView : UIView

@property (nonatomic,weak)id<GPSpaceHeaderViewDelegate>delegate;
+ (instancetype)spaceHeaderView;
@end
