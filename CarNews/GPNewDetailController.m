//
//  GPNewDetailController.m
//  CarNews
//
//  Created by chengxun on 15/5/26.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPNewDetailController.h"
#import "AFNetworking.h"
#import "GPNewDetail.h"
#import "GPRESULT.h"
#import "GPSub_page.h"
#import "GPNew.h"
#import "MJExtension.h"
#import "MBProgressHUD+NJ.h"
#import "GPDetailFooterView.h"
#import "MJRefresh.h"
@interface GPNewDetailController ()<UIWebViewDelegate>
@property (nonatomic,strong)GPNewDetail * newsDetail;
@property (nonatomic,weak)UIWebView * webView;
@end

@implementation GPNewDetailController

- (GPNewDetail*)newsDetail
{
    if(_newsDetail == nil)
    {
        _newsDetail = [[GPNewDetail alloc]init];
    }
    return _newsDetail;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshWebView)];
    /**
     这里设置webview的frame,要去除顶部的导航加底部流出空间的位置
     */
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, GP_SCREEN_W, GP_SCREEN_H-44-64)];

    
    [self.view addSubview:webView];
    
    self.webView = webView;
    
    self.webView.delegate = self;
    
    [self.webView.scrollView addLegendHeaderWithRefreshingBlock:^{
        [self sendURLRequest];
    }];
  
    GPDetailFooterView * detailFooterView = [GPDetailFooterView detailFooterView];
    
    [self.view addSubview:detailFooterView];
}
/**
 *  刷新按钮
 */
- (void)refreshWebView
{
    [self sendURLRequest];
}


- (void)dealloc
{
    /**
     *  根据文档中的提示,controller释放的时候要讲webView的delegate释放掉
     */
    self.webView.delegate = nil;
    
}
- (void)setMyNew:(GPNew *)myNew
{
    _myNew = myNew;
    
    /**
     *  模型传送过来的时候去加载网络请求
     */
    GPLog(@"%s",__func__);
    
    [self sendURLRequest];
}

- (void)sendURLRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showMessage:@"加载中"];
    
    [manager GET:GP_NEWS_DETAIL parameters:@{@"articleId":self.myNew.ID} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.newsDetail = [GPNewDetail objectWithKeyValues:responseObject];
        
     
        
        NSString * urlStr = [NSString stringWithFormat:@"%@",[self.newsDetail.RESULT.sub_pages[0]url]];
        
        NSURL * url = [NSURL URLWithString:urlStr];
        
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
       
        [self.webView loadRequest:request];
        
        //GPLog(@"%s",__func__);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showError:@"网络链接失败"];
    }];
    
}
#pragma mark webView的代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
//    [MBProgressHUD showSuccess:@"加载完毕"];
    [self.webView.scrollView.header endRefreshing];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
    [MBProgressHUD showError:@"网络连接失败"];
    
}
@end
