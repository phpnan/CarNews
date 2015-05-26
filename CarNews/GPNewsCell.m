//
//  GPNewsCell.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPNewsCell.h"
#import "GPNew.h"
#import "UIImageView+AFNetworking.h"
#define ID @"GPNewsCell"
@interface GPNewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;

@end
@implementation GPNewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)newsCellWith:(UITableView*)tableView
{
    UINib * nib = [UINib nibWithNibName:@"GPNewsCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:ID];
    
    GPNewsCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

- (void)setMyNew:(GPNew *)myNew
{
    _myNew = myNew;
    
    self.title.text = myNew.title;
    NSURL * url = [NSURL URLWithString:myNew.header_img_url];
    [self.iconImage setImageWithURL:url];
    NSRange range = {5,5};
    NSString * createTime = [myNew.createTime substringWithRange:range];
    self.createTime.text = createTime;
    
    self.commentCount.text = myNew.commentCount;
    
    
}

@end
