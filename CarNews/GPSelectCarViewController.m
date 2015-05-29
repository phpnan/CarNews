//
//  GPSelectCarViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSelectCarViewController.h"

#import "MJExtension.h"

#import "MJRefresh.h"

#import "AFNetworking.h"

#import "GPCarVideo.h"

#import "GPVideoDetail.h"

#import "GPVideoCell.h"

#import "GPMoviePlayerController.h"

@interface GPSelectCarViewController ()
@property (nonatomic,strong)GPCarVideo * video;
@end

@implementation GPSelectCarViewController


#pragma mark lifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    __block typeof (self)substitute = self;
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [substitute sendRequest];
    }];
    
    [self sendRequest];
}

#pragma mark eventResponse
- (void)sendRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    

    //http://c.m.163.com/nc/video/list/V9LG4B3A0/y/0-10.html
    
    [manager GET:@"http://c.m.163.com/nc/video/list/V9LG4B3A0/y/0-10.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.video = [GPCarVideo objectWithKeyValues:responseObject];
        
        
        [self.tableView reloadData];
        
        [self.tableView.header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        GPLog(@"%@",error);
    }];
}

#pragma mark tableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
  return self.video.carVideo.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPVideoCell * cell  = [GPVideoCell videoCellWith:tableView];
    
    GPVideoDetail * videoDetail = self.video.carVideo[indexPath.row];
    
    cell.detail = videoDetail;
    
    return cell;
}

#pragma mark tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GPVideoDetail * videoDetail = self.video.carVideo[indexPath.row];
    
    GPMoviePlayerController * movieController = [[GPMoviePlayerController alloc]init];
    
    movieController.videoDetail = videoDetail;
    
    [self.navigationController presentViewController:movieController animated:YES completion:^{
        
    }];
    
    GPLog(@"%zi",indexPath.row);
}

#pragma mark getter and setter
- (instancetype)init
{
    return [super initWithStyle:UITableViewStylePlain];
}

- (GPCarVideo*)video
{
    if(_video == nil)
    {
        _video = [[GPCarVideo alloc]init];
        
    }
    return _video;
}




@end
