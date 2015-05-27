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
#import "GPRefreshView.h"

/**
 定义请求的种类,不同的请求将对应不同的请求完成后的操作
 */
typedef enum
{
    RequestTypeScrollView,
    RequestTypeNew

}RequestType;

@interface GPNewsViewController ()
/**
 *  这个是用来接收网络上发送来的数组的模型
 */
@property (nonatomic,strong)GPNews * news;

/**
 *  这个是详细页面的模型
 */
//@property (nonatomic,strong)GPNewDetail * newsDetail;

@property (nonatomic,assign,getter=isRefresh)BOOL refresh;
@property (nonatomic,weak)UILabel * refreshLabel;

//@property (nonatomic,weak)GPRefreshView * refreshView;
@end

@implementation GPNewsViewController


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
    
    [self setUpRefreshLabel];
    
    [self setUpLoadMore];
    
    [self refresh];
   
}

- (void)setUpLoadMore
{
    UIButton * loadMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    loadMoreBtn.frame = CGRectMake(0, 0, GP_SCREEN_W, 44);
    
    loadMoreBtn.backgroundColor = [UIColor redColor];
    
    [loadMoreBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    
    [loadMoreBtn addTarget:self action:@selector(loadMore) forControlEvents:UIControlEventTouchDown];
    
    
    self.tableView.tableFooterView = loadMoreBtn;
}

- (void)loadMore
{
#warning 要去看下加载更多发送的是什么指令,然后进行拼接
    [self sendRequestWith:GP_NEWS_NEW andParameters:@{@"pageSize":@20,@"newsType":@11} andRequestType:RequestTypeNew];
}

- (void)setUpRefreshLabel
{
    
    UILabel * refreshLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -100, GP_SCREEN_W, 44)];
    
    refreshLabel.backgroundColor = [UIColor redColor];
    
    refreshLabel.text = @"下拉刷新";
    
    refreshLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:refreshLabel];
   
    self.refreshLabel = refreshLabel;

}

- (void)refresh
{
    [self sendRequestWith:GP_NEWS_NEW andParameters:@{@"pageSize":@20,@"newsType":@11} andRequestType:RequestTypeNew];
    
    
    
    [self sendRequestWith:GP_NEWS_SCROLLVIEW andParameters:@{@"newsType":@"11"} andRequestType:RequestTypeScrollView];

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
   
    [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        GPNewsHeaderView * newsHeaderView = [GPNewsHeaderView newsHeaderView];
        
        switch (requestType) {
                /**
                 *  读取的是首页新闻的模型数据
                 */
            case RequestTypeNew:
                self.news = [GPNews objectWithKeyValues:responseObject];
                
                [self.tableView reloadData];
                
                break;
                
            case RequestTypeScrollView:
                /**
                 *  首页滚动栏和首页新闻的模型一样,所以也这么读取
                 */
                self.news = [GPNews objectWithKeyValues:responseObject];
                newsHeaderView.news = self.news;
                
                self.tableView.tableHeaderView = newsHeaderView;
                
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
    self.tableView.tableFooterView.hidden = self.news.RESULT.count == 0;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GPNew * myNew = self.news.RESULT[indexPath.row];

    GPNewDetailController * newDetailController = [[GPNewDetailController alloc]init];
    
    newDetailController.view.backgroundColor = [UIColor whiteColor];
    
    newDetailController.myNew = myNew;
    
    newDetailController.title = @"最新";
    
    [self.navigationController showViewController:newDetailController sender:nil];
}
/**
 *  scrollView的代理方法
 *
 *  @param scrollView <#scrollView description#>
 */

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(self.isRefresh)
    {
        [self refresh];
    }
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    
    if(point.y*(-1)>150)
    {
        self.refresh = YES;
        self.refreshLabel.text = @"松开刷新";
    }
    
    else if(point.y*(-1)<150)
    {
        self.refresh = NO;
        self.refreshLabel.text = @"下拉刷新";
        
    }
}






@end
