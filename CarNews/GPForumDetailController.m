//
//  GPForumDetailController.m
//  CarNews
//
//  Created by chengxun on 15/5/28.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPForumDetailController.h"
#import "GPRecDetail.h"
#import "MJExtension.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
@interface GPForumDetailController ()<UIWebViewDelegate>
@property (nonatomic,weak)UIWebView * webView;
@end

@implementation GPForumDetailController

#pragma mark lifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  
    [self loadwebView];
}

#pragma mark event Response
- (void)loadwebView
{
    //http://saa.auto.sohu.com/mobileapp/topic/folnote.do?topicId=48853608466941&bid=11588&page=1&pageSize=15
    
    NSString * urlStr = [NSString stringWithFormat:@"%@?topicId=%@&bid=%zi&page=1&pageSize=15",GP_RECDETAIL,self.recDetail.topicId,self.recDetail.bid];

    NSURL * url = [NSURL URLWithString:urlStr];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    self.webView = webView;
    
    self.webView.delegate = self;
    
    [self.webView.scrollView addLegendHeaderWithRefreshingBlock:^{
        [webView loadRequest:request];
    }];
    
    [webView loadRequest:request];
}


#pragma mark webView的delegate方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    GPLog(@"%s",__func__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    GPLog(@"%s",__func__);
    [self.webView.scrollView.header endRefreshing];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    GPLog(@"%s%@",__func__,error);
}


@end
