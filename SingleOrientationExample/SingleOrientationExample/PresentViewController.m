/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: PresentViewController.m
 **  Description: Present 出来的视图控制器
 **
 **  History
 **  -----------------------------------------------------------------------------------------------
 **  Author: jinnchang
 **  Date: 16/7/20
 **  Version: 1.0.0
 **  Remark: Create
 **************************************************************************************************/

#import "PresentViewController.h"
#import "Masonry.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

#pragma mark - Override

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)backButtonClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end