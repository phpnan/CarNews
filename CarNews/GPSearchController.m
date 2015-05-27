//
//  GPSearchController.m
//  CarNews
//
//  Created by chengxun on 15/5/27.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPSearchController.h"

@interface GPSearchController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)dismissBtnTouch:(id)sender;

@end

@implementation GPSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)dismissBtnTouch:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
