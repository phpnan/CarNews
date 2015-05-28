//
//  GPPreCell.m
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPPreCell.h"
#import "UIImageView+AFNetworking.h"
#import "GPListDetail.h"
#define collectionViewCellId @"collectionViewCellId"
@interface GPPreCell()

@property (nonatomic,weak)UIImageView * contentImage;
@property (nonatomic,weak)UILabel * contentLabel;
@end
@implementation GPPreCell

+ (instancetype)preCellWith:(UICollectionView*)collectionView andIndexPath:(NSIndexPath*)indexPath
{
    [collectionView registerClass:[GPPreCell class] forCellWithReuseIdentifier:collectionViewCellId];
    GPPreCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIImageView * contentImage = [[UIImageView alloc]init];
        
        [self.contentView addSubview:contentImage];
        
        self.contentImage = contentImage;
        
        UILabel * contentLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:contentLabel];
        
        self.contentLabel = contentLabel;
        
        self.contentLabel.numberOfLines = 0;
        
        self.contentLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

- (void)setListDetail:(GPListDetail *)listDetail
{
    _listDetail = listDetail;
    
    NSURL * url = [NSURL URLWithString:listDetail.imgUrl];
    
    [self.contentImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.contentLabel.text = listDetail.title;
    
}
- (void)layoutSubviews
{
    self.contentImage.frame = CGRectMake(0, 0, 100, 60);
    self.contentLabel.frame = CGRectMake(0, 60, 100, 40);
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
}




@end
