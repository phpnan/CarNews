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
@interface GPNewDetailController ()<UIWebViewDelegate>
@property (nonatomic,strong)GPNewDetail * newsDetail;
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
- (void)loadView
{
    self.view = [[UIWebView alloc]init];
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshWebView)];
    
}

- (void)refreshWebView
{
    [self sendURLRequest];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    NSLog(@"我被释放啦!");
}
- (void)setMyNew:(GPNew *)myNew
{
    _myNew = myNew;
    
    [self sendURLRequest];
}

- (void)sendURLRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showMessage:@"加载中"];
    
    [manager GET:GP_NEWS_DETAIL parameters:@{@"articleId":self.myNew.ID} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.newsDetail = [GPNewDetail objectWithKeyValues:responseObject];
        
        UIWebView * webView = (UIWebView*)self.view;
        
        webView.delegate = self;
        
        NSString * urlStr = [NSString stringWithFormat:@"%@",[self.newsDetail.RESULT.sub_pages[0]url]];
        
        NSURL * url = [NSURL URLWithString:urlStr];
        
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
       
        [webView loadRequest:request];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showError:@"网络链接失败"];
    }];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
    [MBProgressHUD showSuccess:@"加载完毕"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
    [MBProgressHUD showError:@"网络连接失败"];
    
}
@end
