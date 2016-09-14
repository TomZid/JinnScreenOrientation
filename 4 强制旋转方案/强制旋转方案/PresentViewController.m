/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: PresentViewController.m
 **  Description: Present 出来的视图控制器
 **
 **  Author:  jinnchang
 **  Date:    16/9/14
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "PresentViewController.h"

#define MIN_SCREEN_SIDE MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define MAX_SCREEN_SIDE MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)

@interface PresentViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (nonatomic, assign) BOOL portrait;

@end

@implementation PresentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.portrait = YES;
}

#pragma mark - IBAction

- (IBAction)forceRotation:(id)sender
{
    if (self.portrait)
    {
        [self setPortrait:NO];
        [self forceLandscapeLeft];
        [self.backButton setHidden:YES];
    }
    else
    {
        [self setPortrait:YES];
        [self forcePortrait];
        [self.backButton setHidden:NO];
    }
}

- (IBAction)backButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private

/**
 *  强制左横屏
 */
- (void)forceLandscapeLeft
{
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
        self.view.bounds = CGRectMake(0, 0, MAX_SCREEN_SIDE, MIN_SCREEN_SIDE);
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
        self.view.transform = CGAffineTransformIdentity;
        self.view.bounds = CGRectMake(0, 0, MIN_SCREEN_SIDE, MAX_SCREEN_SIDE);
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    }];
}

#pragma mark - Orientation

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