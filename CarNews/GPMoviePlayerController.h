//
//  GPMoviePlayerController.h
//  CarNews
//
//  Created by chengxun on 15/5/29.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
@class GPVideoDetail;
@interface GPMoviePlayerController : MPMoviePlayerViewController
@property (nonatomic,strong)GPVideoDetail * videoDetail;
@end
