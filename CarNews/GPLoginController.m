//
//  GPLoginController.m
//  CarNews
//
//  Created by chengxun on 15/5/25.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPLoginController.h"

@interface GPLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
- (IBAction)loginTouch:(UIButton *)sender;
- (IBAction)registerTouch:(UIButton *)sender;

@end

@implementation GPLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.accountField becomeFirstResponder];
    
    UIBarButtonItem * getPwd = [[UIBarButtonItem alloc]initWithTitle:@"找回密码" style:UIBarButtonItemStylePlain target:self action:@selector(getPwdMessage)];
    self.navigationItem.rightBarButtonItem = getPwd;
    // Do any additional setup after loading the view from its nib.
}

- (void)getPwdMessage
{
#warning 找回密码
    GPLog(@"找回密码");
}

- (IBAction)loginTouch:(UIButton *)sender {
#warning 发送请求登录
    GPLog(@"登录");
}

- (IBAction)registerTouch:(UIButton *)sender {
#warning 发送请求注册
    GPLog(@"注册");
}
@end
