//
//  BaseNavigationController.h
//  BaseNavigationController
//
//  Created by jinnchang on 15/7/19.
//  Copyright (c) 2015年 Gloomy Summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

/**
 *  改变支持的旋转方向
 *
 *  @param interfaceOrientation 支持的旋转方向
 */
- (void)changeSupportedInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientation;

@end