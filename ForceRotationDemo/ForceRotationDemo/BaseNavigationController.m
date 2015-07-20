//
//  BaseNavigationController.m
//  BaseNavigationController
//
//  Created by jinnchang on 15/7/19.
//  Copyright (c) 2015年 Gloomy Summer. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController()

@property (nonatomic, assign) UIInterfaceOrientationMask interfaceOrientationMask;

@end

@implementation BaseNavigationController

// 改变支持的旋转方向
- (void)changeSupportedInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientation{
    
    _interfaceOrientationMask = interfaceOrientation;
}

// 返回是否支持屏幕旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

// 返回支持的旋转方向
- (NSUInteger)supportedInterfaceOrientations
{
    return _interfaceOrientationMask;
}

@end

