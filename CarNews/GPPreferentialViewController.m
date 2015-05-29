//
//  GPPreferentialViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPPreferentialViewController.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "GPPrefer.h"
#import "GPPreResult.h"
#import "GPListDetail.h"
#import "GPPreCell.h"
#import "MJRefresh.h"
#import "GPPreDetailController.h"
@interface GPPreferentialViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong)GPPrefer * prefer;
@property (nonatomic,weak)UICollectionView * collectionView;
@end

@implementation GPPreferentialViewController

#pragma mark lifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpCollectionView];
    
    [self sendURLRequest];
}
#pragma mark installView
- (void)setUpCollectionView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 0, 10);
    
    layout.itemSize = CGSizeMake(100, 100);
    
    layout.minimumLineSpacing = 10;
    
    layout.minimumInteritemSpacing = 10;
    
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, GP_SCREEN_W, GP_SCREEN_H-64) collectionViewLayout:layout];
    
    self.collectionView = collectionView;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    /**
     *  下拉刷新的MJRefresh
     */
    
    [self.collectionView addLegendHeaderWithRefreshingBlock:^{
        [self sendURLRequest];
    }];
    
    [self.view addSubview:self.collectionView];
}


#pragma mark eventResponse

- (void)sendURLRequest
{
    AFHTTPRequestOperationManager * mgr =[AFHTTPRequestOperationManager manager];
    
    [mgr GET:GP_CHIOCEINDEX parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.prefer = [GPPrefer objectWithKeyValues:responseObject];
        
        [self.collectionView.header endRefreshing];
        
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        GPLog(@"%@",error);
    }];
    
}

#pragma mark collecitonViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.prefer.RESULT.count;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    GPPreResult * preResult = self.prefer.RESULT[section];
    
    return preResult.list.count;

}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString * collectionViewHeader =[NSString stringWithFormat:@"collectionViewHeader%zi",indexPath.section] ;
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionViewHeader];
    
    UICollectionReusableView *Header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionViewHeader forIndexPath:indexPath];
    /**
     *  移除╮(╯_╰)╭每次新创建出来的label和button
     */
    for(UIView * view in Header.subviews)
    {
        [view removeFromSuperview];
    }
    
    
    UILabel * prelabel = [[UILabel alloc]init];
    
    UIButton * prebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    prelabel.frame = CGRectMake(10, 10, 80, 20);
    
    prelabel.font = [UIFont systemFontOfSize:12];
    
    prebtn.frame = CGRectMake(GP_SCREEN_W-40, 10, 30, 20);
    
    [prebtn setBackgroundImage:[UIImage imageNamed:@"forummoreS"] forState:UIControlStateNormal];
    
    [Header addSubview:prebtn];
    
    GPPreResult * preResult = self.prefer.RESULT[indexPath.section];
    
    prelabel.text = preResult.cnName;
    
    [Header addSubview:prelabel];
    
    
    return Header;
    
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GPPreCell * cell = [GPPreCell preCellWith:collectionView andIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor redColor];
    GPPreResult * preResult = self.prefer.RESULT[indexPath.section];
    GPListDetail * listDetail = preResult.list[indexPath.item];
    cell.listDetail = listDetail;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(GP_SCREEN_W, 20);
}
#pragma mark collectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GPPreResult * preResult = self.prefer.RESULT[indexPath.section];
    GPListDetail * listDetail = preResult.list[indexPath.item];
    GPPreDetailController * detail = [[GPPreDetailController alloc]init];
    detail.listDetail = listDetail;
    
    [self.navigationController showViewController:detail sender:nil];
    
}



#pragma mark getter and setter

- (GPPrefer*)prefer
{
    if(_prefer == nil)
    {
        _prefer = [[GPPrefer alloc]init];
    }
    return _prefer;
}

@end
