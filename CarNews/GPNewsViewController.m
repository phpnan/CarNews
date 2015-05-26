//
//  GPNewsViewController.m
//  GPCarNews
//
//  Created by chengxun on 15/5/23.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPNewsViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "GPNews.h"
#import "GPNew.h"
#import "GPNewsCell.h"
#import "GPNewsHeaderView.h"
@interface GPNewsViewController ()
@property (nonatomic,strong)GPNews * news;
@end

@implementation GPNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.view.backgroundColor = [UIColor whiteColor];
    

    GPNewsHeaderView * newsHeaderView = [GPNewsHeaderView newsHeaderView];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary * parameters = @{@"newsType":@"11"};
    
    [manager GET:@"http://mobile.auto.sohu.com/mcms/external/getFocusNews.at" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        GPNews * news = [GPNews objectWithKeyValues:responseObject];
        
        newsHeaderView.news = news;
        
        self.tableView.tableHeaderView = newsHeaderView;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        GPLog(@"失败");
    }];
    
    
    [self sendRequest];
}

- (void)sendRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    /**
     *  这个参数是具体的访问项
     */
    NSDictionary * parameters = @{@"pageSize":@20,@"newsType":@11};
    
    [manager GET:@"http://mobile.auto.sohu.com/mcms/external/getNews.at" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        GPNews * news = [GPNews objectWithKeyValues:responseObject];
        
        self.news = news;
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        GPLog(@"失败");
    }];
}

/**
 *  点击搜索按钮时要调用的方法
 */
- (void)search
{
    NSLog(@"search");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.RESULT.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPNewsCell * cell = [GPNewsCell newsCellWith:tableView];
 
    GPNew * new = self.news.RESULT[indexPath.row];
    
    cell.myNew = new;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#warning 选中后跳转到下一个界面时的设置,..等待完成

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GPLog(@"选中了%zi行",indexPath.row);
}



@end
