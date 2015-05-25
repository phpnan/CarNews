//
//  GPSettingCell.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSettingCell.h"
#import "GPSettingItem.h"
#import "GPArrowItem.h"
@interface GPSettingCell()
@property (nonatomic,strong)UIImageView * arrowView;


@end
@implementation GPSettingCell
- (UIImageView*)arrowView
{
    if(_arrowView == nil)
    {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellRight"]];
        
    }
    return _arrowView;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItem:(GPSettingItem *)item
{
    [self setData:item];
    [self setRightAccessory:item];
}

- (void)setRightAccessory:(GPSettingItem *)item
{
    if([item isKindOfClass:[GPArrowItem class]])
    {
        self.accessoryView = self.arrowView;
    }
}

- (void)setData:(GPSettingItem*)item
{
    self.textLabel.text = item.title;
    /**
     *  如果有图标才传图标
     */
    if(item.icon)
    {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    if(item.detail)
    {
        self.detailTextLabel.text = item.detail;
    }
}


@end
