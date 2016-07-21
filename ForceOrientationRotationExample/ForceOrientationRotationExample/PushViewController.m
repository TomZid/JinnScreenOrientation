/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: PushViewController.m
 **  Description: Push 出来的视图控制器
 **
 **  History
 **  -----------------------------------------------------------------------------------------------
 **  Author: jinnchang
 **  Date: 16/7/20
 **  Version: 1.0.0
 **  Remark: Create
 **************************************************************************************************/

#import "PushViewController.h"
#import "Masonry.h"
#import "JinnNavigationController.h"

@interface PushViewController ()

@property (nonatomic, assign) BOOL isPortrait;

@end

@implementation PushViewController

#pragma mark - Override

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *  这种强制旋转方式尽量不要使用 NavigationController 自带的返回按钮（因为需要在页面关闭前将方向复原）
     *
     *  而且旋转动画也有一点点瑕疵，不是很建议使用这种方式，需求场景能不使用强制旋转就尽量不要使用吧，特殊场景的话酌情考虑
     */
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_centerY);
    }];
    
    UIButton *forceRotationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [forceRotationButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [forceRotationButton setTitle:@"Force Rotation" forState:UIControlStateNormal];
    [forceRotationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forceRotationButton addTarget:self action:@selector(forceRotationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forceRotationButton];
    [forceRotationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_centerY);
    }];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.isPortrait = YES;
}

#pragma mark - View Action

- (void)backButtonClicked
{
    if (!self.isPortrait)
    {
        [self forcePortrait];
        [self.navigationController popViewControllerAnimated:NO];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)forceRotationButtonClicked
{
    if (self.isPortrait)
    {
        [self setIsPortrait:NO];
        [self forceLandscapeLeft];
    }
    else
    {
        [self setIsPortrait:YES];
        [self forcePortrait];
    }
}

#pragma mark - Private

/**
 *  强制左横屏
 */
- (void)forceLandscapeLeft
{
    [(JinnNavigationController *)self.navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscapeLeft];
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationLandscapeLeft;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

/**
 *  强制竖屏
 */
- (void)forcePortrait
{
    [(JinnNavigationController *)self.navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
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