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
@interface GPForumDetailController ()<UIWebViewDelegate>
@property (nonatomic,weak)UIWebView * webView;
@end

@implementation GPForumDetailController
#pragma mark lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    
    [self sendRequest];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"查看全部";
    
    UIWebView * webView = [[UIWebView alloc]init];
   
    self.webView = webView;
    
    self.webView.delegate = self;
    
   }

#pragma mark event Response
- (void)sendRequest
{
    //http://saa.auto.sohu.com/mobileapp/topic/folnote.do?topicId=48853608466941&bid=11588&page=1&pageSize=15
    
    NSString * urlString = [NSString stringWithFormat:@"%@?topicId=%@&bid=%zi&page=1&pageSize=15",GP_RECDETAIL,self.recDetail.topicId,self.recDetail.bid];
    
    GPLog(@"%@",urlString);
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}
#warning webView 的load的方法都没有调用!!!
#pragma mark webViewdelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    GPLog(@"%s",__func__);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    GPLog(@"%s",__func__);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    GPLog(@"%@",error);
}





@end
