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
@interface GPNewDetailController ()
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
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMyNew:(GPNew *)myNew
{
    _myNew = myNew;
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    __unsafe_unretained typeof(self) share = self;
    [manager GET:GP_NEWS_DETAIL parameters:@{@"articleId":myNew.ID} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        share.newsDetail = [GPNewDetail objectWithKeyValues:responseObject];
        
        UIWebView * webView = (UIWebView*)share.view;
        
        NSLog(@"%@",[share.newsDetail.RESULT.sub_pages[0]url]);
        
        NSString * urlStr = [NSString stringWithFormat:@"%@",[share.newsDetail.RESULT.sub_pages[0]url]];
        
        NSLog(@"%@",urlStr);
        
        NSURL * url = [NSURL URLWithString:urlStr];
        
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        
        [webView loadRequest:request];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"网络链接失败"];
    }];
}

@end
