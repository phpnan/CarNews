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
#import "GPSearchController.h"
#import "MJRefresh.h"
/**
 定义请求的种类,不同的请求将对应不同的请求完成后的操作
 */
typedef enum
{
    RequestTypeScrollView,
    RequestTypeNew,
    RequestTypeRefresh

}RequestType;

@interface GPNewsViewController ()
/**
 *  这个是用来接收网络上发送来的数组的模型
 */
@property (nonatomic,strong)GPNews * news;

@property (nonatomic,strong)GPNews * scrollViewNews;
@property (nonatomic,strong)NSMutableArray * resultArray;

@property (nonatomic,assign,getter=isRefresh)BOOL refresh;
@property (nonatomic,weak)UILabel * refreshLabel;

//@property (nonatomic,weak)GPRefreshView * refreshView;


@end

@implementation GPNewsViewController
#pragma mark lifeCycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
   
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     *  添加下拉刷新和上拉加载的控件
     *
     */
    __block typeof(self)substitute = self;
    
    [self refresh];
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [substitute refresh];
    }];
    
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [substitute loadMore];
    }];
}

#pragma mark event response

/**
 *  加载更多的方法
 */
- (void)loadMore
{
    NSString * lastId = [[self.resultArray lastObject]ID ];
    
    //[[self.news.RESULT lastObject]ID ];
    
    NSDictionary * params = @{@"pageSize":@20,@"newsType":@11,@"lastId":lastId};
    
    [self sendRequestWith:GP_NEWS_NEW andParameters:params andRequestType:RequestTypeNew];
   
    //http://mobile.auto.sohu.com/mcms/external/getNews.at?pageSize=20&newsType=11&lastId=53175708
}

/**
 *  下拉刷新的方式是重复请求第一页,所以由于此时发送请求得到数据就不应该加到数组里面,这里要做一个单独的请求(第一页的)
 */
- (void)refresh
{
    [self sendRequestWith:GP_NEWS_NEW andParameters:@{@"pageSize":@20,@"newsType":@11} andRequestType:RequestTypeRefresh];
    
    
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
        //GPLog(@"%@",responseObject);
        
        GPNewsHeaderView * newsHeaderView = [GPNewsHeaderView newsHeaderView];
        
        switch (requestType) {
                /**
                 *  读取的是首页新闻的模型数据
                 */
            case RequestTypeScrollView:
                /**
                 *  首页滚动栏和首页新闻的模型一样,所以也这么读取
                 */
                self.scrollViewNews = [GPNews objectWithKeyValues:responseObject];
                
                newsHeaderView.news = self.scrollViewNews;
                
                self.tableView.tableHeaderView = newsHeaderView;
                
                
            case RequestTypeNew:
                
                self.news = [GPNews objectWithKeyValues:responseObject];
                /**
                 *  判断上啦加载更多的firstID和原来数组中的firstID是否相同,如果不相同,才添加
                 */
//               if(![[[self.news.RESULT firstObject]ID] isEqualToString: [[self.resultArray firstObject]ID]])
//               {
                   for(GPNew * mynew in self.news.RESULT)
                   {
                       [self.resultArray addObject:mynew];
                   }
               
                [self.tableView.footer endRefreshing];
                
                [self.tableView reloadData];
                
                break;
                
           
                
            case RequestTypeRefresh:
                
                self.news = [GPNews objectWithKeyValues:responseObject];
                
                if(![[[self.news.RESULT firstObject]ID] isEqualToString: [[self.resultArray firstObject]ID]])
                {
                    NSMutableArray * tmp = [NSMutableArray array];
                    /**
                     *  将新得到数据插入原来的数组中
                     */
                    for(GPNew * myNew in self.news.RESULT)
                    {
                        [tmp addObject:myNew];
                        
                    }
                    
                    NSRange range = {0,self.news.RESULT.count};
                    
                    NSIndexSet * indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
                    
                    [self.resultArray insertObjects:tmp atIndexes:indexSet];
                    
                    
                    [self.tableView reloadData];
                }
                [self.tableView.header endRefreshing];
                break;
                
            default:
                break;
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showError:@"请检查网络链接"];
        
    }];

}

- (void)search
{
    GPSearchController * searchController = [[GPSearchController alloc]init];
    [self presentViewController:searchController animated:YES completion:^{
    }];
}

#pragma mark tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.tableFooterView.hidden = self.news.RESULT.count == 0;
    GPLog(@"%zi",self.resultArray.count);
    return self.resultArray.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPNewsCell * cell = [GPNewsCell newsCellWith:tableView];
 
    GPNew * myNew = self.resultArray[indexPath.row];
    //self.news.RESULT[indexPath.row];
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
    
    GPNew * myNew = self.resultArray[indexPath.row];

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
#pragma mark scrollViewDelegate
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    if(self.isRefresh)
//    {
//        [self refresh];
//    }
//    
//}
//
//
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGPoint point = scrollView.contentOffset;
//    
//    if(point.y*(-1)>150)
//    {
//        self.refresh = YES;
//        self.refreshLabel.text = @"松开刷新";
//    }
//    
//    else if(point.y*(-1)<150)
//    {
//        self.refresh = NO;
//        self.refreshLabel.text = @"下拉刷新";
//        
//    }
//}

#pragma mark setter and getter
- (NSMutableArray *)resultArray
{
    if(_resultArray == nil)
    {
        _resultArray  = [[NSMutableArray alloc]init];
    }
    return _resultArray;
}
- (GPNews*)news
{
    if(_news == nil)
    {
        _news = [[GPNews alloc]init];
    }
    return _news;
}

- (GPNews*)scrollViewNews
{
    if(_scrollViewNews == nil)
    {
        _scrollViewNews = [[GPNews alloc]init];
        
    }
    return _scrollViewNews;
}





@end
