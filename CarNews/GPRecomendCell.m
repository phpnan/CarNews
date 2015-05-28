//
//  GPRecomendCell.m
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPRecomendCell.h"
#import "GPRecDetail.h"
@interface GPRecomendCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *barName;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end
@implementation GPRecomendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)recomendCellWith:(UITableView*)tableView
{
    UINib * nib = [UINib nibWithNibName:@"GPRecomendCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:@"recomendCell"];
    GPRecomendCell * cell = [tableView dequeueReusableCellWithIdentifier:@"recomendCell"];
    return cell;
}

- (void)setRecDetail:(GPRecDetail *)recDetail
{
    _recDetail = recDetail;
    
    self.title.text = recDetail.title;
    
    self.nickName.text = recDetail.nickName;
    
    self.barName.text = recDetail.barName;
    
    self.replyCount.text = [NSString stringWithFormat:@"%zi",recDetail.replayCount];
    
}

@end
