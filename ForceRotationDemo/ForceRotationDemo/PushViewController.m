//
//  PushViewController.m
//  ForceRotationDemo
//
//  Created by jinnchang on 15/7/19.
//  Copyright (c) 2015年 Gloomy Summer. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController
{
    UIButton *backBtn;
    UIButton *forceRotationBtn;
    
    BOOL isPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Force Rotation";
    self.view.backgroundColor = [UIColor orangeColor];
    
    isPortrait = YES;
    
    /**
     *  这种强制旋转方式尽量不要使用 NavigationController 自带的返回按钮（因为需要在页面关闭前将方向复原）
     *  
     *  而且旋转动画也有一点点瑕疵，不是很建议使用这种方式，需求场景能不使用强制旋转就尽量不要使用吧，特殊场景的话酌情考虑
     */
    self.navigationItem.hidesBackButton = YES;
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    forceRotationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forceRotationBtn setTitle:@"Force Rotation" forState:UIControlStateNormal];
    [forceRotationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forceRotationBtn addTarget:self action:@selector(forceRotation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forceRotationBtn];
    
    [self viewsAutoLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewsAutoLayout
{
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_centerY);
    }];
    
    [forceRotationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_centerY);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

- (void)back
{
    /**
     *  页面关闭前将方向复原
     */
    if (!isPortrait) {
        [self ForcePortrait];
        [self.navigationController popViewControllerAnimated:NO];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }    
}

- (void)forceRotation
{
    if (isPortrait) {
        isPortrait = NO;
        [self ForceLandscapeLeft];
    } else {
        isPortrait = YES;
        [self ForcePortrait];
    }
}

// 强制左横屏
- (void)ForceLandscapeLeft
{
    [(BaseNavigationController *)self.navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscapeLeft];
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationLandscapeLeft;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

// 强制竖屏
- (void)ForcePortrait
{
    [(BaseNavigationController *)self.navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationPortrait;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

@end