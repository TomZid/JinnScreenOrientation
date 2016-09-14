/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: JinnNavigationController.m
 **  Description: 基础导航控制器
 **
 **  Author:  jinnchang
 **  Date:    16/9/14
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "JinnNavigationController.h"

@interface JinnNavigationController ()

@property (nonatomic, assign) UIInterfaceOrientationMask interfaceOrientationMask;

@end

@implementation JinnNavigationController

#pragma mark - Override

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    
    if (self)
    {
        [self changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    }
    
    return self;
}

#pragma mark - Orientation

/**
 *  改变支持的旋转方向
 *
 *  @param interfaceOrientationMask
 */
- (void)changeSupportedInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientationMask
{
    self.interfaceOrientationMask = interfaceOrientationMask;
}

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
    return self.interfaceOrientationMask;
}

@end