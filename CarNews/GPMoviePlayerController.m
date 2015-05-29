//
//  GPMoviePlayerController.m
//  CarNews
//
//  Created by chengxun on 15/5/29.
//  Copyright (c) 2015年 chengxun. All rights reserved.
//

#import "GPMoviePlayerController.h"
#import "GPVideoDetail.h"
@interface GPMoviePlayerController ()

@end

@implementation GPMoviePlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL * url = [NSURL URLWithString:self.videoDetail.mp4_url];
    
    self.moviePlayer.contentURL = url;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
