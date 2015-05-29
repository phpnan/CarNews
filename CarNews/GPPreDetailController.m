//
//  GPPreDetailController.m
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPPreDetailController.h"
#import "GPListDetail.h"
#import "MJRefresh.h"
#import "MBProgressHUD+NJ.h"
@interface GPPreDetailController ()<UIWebViewDelegate>
@property (nonatomic,weak)UIWebView * webView;
@end

@implementation GPPreDetailController
#pragma mark lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self installWebView];
}

#pragma mark install

- (void)installWebView
{
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, GP_SCREEN_W, GP_SCREEN_H-64)];
    
    self.webView = webView;
    
    [self.view addSubview:self.webView];
    
    self.webView.delegate = self;
    
    [self.webView.scrollView addLegendHeaderWithRefreshingBlock:^{
        [self sendRequest];
    }];
    
}

- (void)sendRequest
{
    NSString * urlStr = [NSString stringWithFormat:@"%@?topicId=%@&bid=%@&page=1&pageSize=15",GP_RECDETAIL,self.listDetail.topicId,self.listDetail.bid];
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView.scrollView.header endRefreshing];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    GPLog(@"%@",error);
    [MBProgressHUD showError:@"链接超时"];
}


@end
