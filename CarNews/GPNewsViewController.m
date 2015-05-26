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
#import "MBProgressHUD+NJ.h"
#import "GPNewDetail.h"
#import "GPRESULT.h"
#import "GPSub_page.h"
#import "GPNewDetailController.h"


/**
 定义请求的种类,不同的请求将对应不同的请求完成后的操作
 */
typedef enum
{
    RequestTypeScrollView,
    RequestTypeNew,
    RequestTypeDetail

}RequestType;

@interface GPNewsViewController ()
/**
 *  这个是用来接收网络上发送来的数组的模型
 */
@property (nonatomic,strong)GPNews * news;
/**
 *  这个是详细页面的模型
 */
@property (nonatomic,strong)GPNewDetail * newsDetail;

@end

@implementation GPNewsViewController

- (GPNewDetail*)newsDetail
{
    if(_newsDetail == nil)
    {
        _newsDetail = [[GPNewDetail alloc]init];
    }
    return _newsDetail;
}
- (GPNews*)news
{
    if(_news == nil)
    {
        _news = [[GPNews alloc]init];
    }
    return _news;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
   
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self sendRequestWith:GP_NEWS_NEW andParameters:@{@"pageSize":@20,@"newsType":@11} andRequestType:RequestTypeNew];
    
    [self sendRequestWith:GP_NEWS_SCROLLVIEW andParameters:@{@"newsType":@"11"} andRequestType:RequestTypeScrollView];
    /**
     刷新空间
     */
    [self setUpRefreshControl];
   
}
/**
 *  添加下拉刷新按钮
 */
- (void)setUpRefreshControl
{
    UIRefreshControl * refreshControl = [[UIRefreshControl alloc]init];
    
    [self.tableView addSubview:refreshControl];
    
    [refreshControl addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
}

/**
 *  当监测到下拉刷新变化时,重新发送请求
 *
 */
- (void)refreshStateChange:(UIRefreshControl*)refreshControl
{
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];

    __unsafe_unretained typeof(self) share = self;
    
    [manager GET:GP_NEWS_NEW parameters:@{@"pageSize":@20,@"newsType":@11} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        share.news = [GPNews objectWithKeyValues:responseObject];
        
        [share.tableView reloadData];
        
        [refreshControl endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [refreshControl endRefreshing];
        [MBProgressHUD showError:@"没有网络"];
    }];
}

/**
 *  发送网络请求,判断请求类型
 *
 *  @param urlStr      url
 *  @param params      查询的参数
 *  @param requestType 请求的类型
 */

- (void)sendRequestWith:(NSString*)urlStr andParameters:(NSDictionary*)params andRequestType:(RequestType)requestType
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    __unsafe_unretained typeof(self) share = self;
    [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        GPNewsHeaderView * newsHeaderView = [GPNewsHeaderView newsHeaderView];
        
        switch (requestType) {
                /**
                 *  读取的是首页新闻的模型数据
                 */
            case RequestTypeNew:
                share.news = [GPNews objectWithKeyValues:responseObject];
                [share.tableView reloadData];
                
                break;
                
            case RequestTypeScrollView:
                /**
                 *  首页滚动栏和首页新闻的模型一样,所以也这么读取
                 */
                share.news = [GPNews objectWithKeyValues:responseObject];
                newsHeaderView.news = share.news;
                
                share.tableView.tableHeaderView = newsHeaderView;
                break;
            case RequestTypeDetail:
                /**
                 *  给将要推出的详情界面传送数据
                 */
                share.newsDetail = [GPNewDetail objectWithKeyValues:responseObject];
                GPLog(@"");
                
                break;
            default:
                break;
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showError:@"请检查网络链接"];
        
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
 
    GPNew * myNew = self.news.RESULT[indexPath.row];
    /**
     *  将取好的模型传递给定义好的cell对象
     */
    cell.myNew = myNew;
    
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
    
    GPNew * myNew = self.news.RESULT[indexPath.row];
 
    [self sendRequestWith:GP_NEWS_DETAIL andParameters:@{@"articleId":   myNew.ID} andRequestType:RequestTypeDetail];
    
    /**
     *  点击这个tableViewCell之后会去访问一个detail的json,然后提供给下一个控制器解析的html的地址
     */
    
    GPNewDetailController * newDetailController = [[GPNewDetailController alloc]init];
    
    newDetailController.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController showViewController:newDetailController sender:nil];
    
}



@end
