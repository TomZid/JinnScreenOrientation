/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: AutoRotationViewController.m
 **  Description: 自动任意旋转视图
 **
 **  Author:  jinnchang
 **  Date:    16/9/18
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "AutoRotationViewController.h"

@interface AutoRotationViewController ()

@end

@implementation AutoRotationViewController

#pragma mark - IBAction

- (IBAction)backButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Orientation

/**
 *  返回是否支持屏幕旋转
 *
 *  @return
 */
- (BOOL)shouldAutorotate
{
    return YES;
}

/**
 *  返回支持的旋转方向
 *
 *  @return
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
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