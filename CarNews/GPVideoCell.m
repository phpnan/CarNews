//
//  GPVideoCell.m
//  CarNews
//
//  Created by chengxun on 15/5/29.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPVideoCell.h"
#import "GPVideoDetail.h"
#import "UIImageView+AFNetworking.h"
@interface GPVideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *videoImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *length;

@end
@implementation GPVideoCell


+(instancetype)videoCellWith:(UITableView*)tableView
{
    UINib * nib = [UINib nibWithNibName:@"GPVideoCell" bundle:nil];
    
    static NSString * ID = @"videoCell";
    
    [tableView registerNib:nib forCellReuseIdentifier:ID];
    
    GPVideoCell * cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;

}


- (void)setDetail:(GPVideoDetail *)detail
{
    _detail = detail;
    
    
    
    self.length.text = [NSString stringWithFormat:@"时长:%zi秒",detail.length];
   
    self.playCount.text = [NSString stringWithFormat:@"播放次数:%zi", detail.playCount];
    
    self.title.text = detail.title;
    
    NSURL * url = [NSURL URLWithString:detail.cover];
    
    [self.videoImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, 0, GP_SCREEN_W, 100);
}

@end
