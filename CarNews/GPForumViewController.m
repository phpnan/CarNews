//
//  GPForumViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPForumViewController.h"
#import "GPRecDetail.h"
#import "GPRecomend.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "GPRecomendCell.h"
#import "GPForumDetailController.h"
#import "MJRefresh.h"
@interface GPForumViewController ()
@property (nonatomic,strong)GPRecomend * recomend;
@end

@implementation GPForumViewController

#pragma mark lifeCycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self sendRequest];
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    __block typeof(self)substitute = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [substitute sendRequest];
    }];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark  eventResponse
- (void)sendRequest
{
    GPLog(@"%s",__func__);
    
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:GP_RECOMMENDTOPICS parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.recomend = [GPRecomend objectWithKeyValues:responseObject];
        
        [self.tableView reloadData];
        
        [self.tableView.header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        GPLog(@"%@",error);
    }];
}

#pragma mark  tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recomend.RESULT.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPRecomendCell * cell = [GPRecomendCell recomendCellWith:tableView];
    cell.recDetail = self.recomend.RESULT[indexPath.row];
    return cell;
}

#pragma mark tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       /**
     *  点击之后去链接相应的网址,传递相应的模型
     */
    GPForumDetailController * forumDetailController = [[GPForumDetailController alloc]init];
    
    forumDetailController.view.backgroundColor = [UIColor whiteColor];
    
    forumDetailController.recDetail = self.recomend.RESULT[indexPath.row];
  
    [self.navigationController showViewController:forumDetailController sender:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    //http://saa.auto.sohu.com/mobileapp/topic/folnote.do?topicId=48853608466941&bid=11588&page=1&pageSize=15
}

#pragma mark getter and setter
- (GPRecomend*)recomend
{
    if(_recomend == nil)
    {
        _recomend = [[GPRecomend alloc]init];
    }
    return _recomend;
}


@end
