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

#define MIN_SCREEN_SIDE MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))
#define MAX_SCREEN_SIDE MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))

@interface PresentViewController ()

@property (nonatomic, assign) BOOL isPortrait;
@property (nonatomic, strong) UIButton *forceRotationButton;

@end

@implementation PresentViewController

#pragma mark - Override

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    UIButton *forceRotationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [forceRotationButton setBackgroundColor:[UIColor blackColor]];
    [forceRotationButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [forceRotationButton setTitle:@"Force Rotation" forState:UIControlStateNormal];
    [forceRotationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forceRotationButton addTarget:self action:@selector(forceRotationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forceRotationButton];
    [self setForceRotationButton:forceRotationButton];
    [forceRotationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.left.right.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5f);
    }];
    
    self.view.backgroundColor = [UIColor brownColor];
    self.isPortrait = YES;
}

#pragma mark - View Action

- (void)backButtonClicked
{
    if (!self.isPortrait) // 页面关闭前将方向复原
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.bounds = CGRectMake(0, 0, MIN_SCREEN_SIDE, MAX_SCREEN_SIDE);
        
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    
    [UIView animateWithDuration:duration animations:^{
        self.forceRotationButton.transform = CGAffineTransformMakeRotation(-M_PI_2);
        self.forceRotationButton.bounds = CGRectMake(0, 0, MAX_SCREEN_SIDE, MIN_SCREEN_SIDE);
        self.forceRotationButton.center = self.view.center;
        
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
    }];
}

/**
 *  强制竖屏
 */
- (void)forcePortrait
{
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    
    [UIView animateWithDuration:duration animations:^{
        self.forceRotationButton.transform = CGAffineTransformIdentity;
        self.forceRotationButton.bounds = CGRectMake(0, 0, MIN_SCREEN_SIDE, MAX_SCREEN_SIDE / 2);
        
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    }];
}

#pragma mark - Orientations

/**
 *  返回是否支持屏幕旋转
 *
 *  @return
 */
- (BOOL)shouldAutorotate
{
    return NO;
}

/**
 *  返回支持的旋转方向
 *
 *  @return
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

/**
 *  返回优先显示的屏幕方向，该方法只对 PresentViewController 有效
 *
 *  @return
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end