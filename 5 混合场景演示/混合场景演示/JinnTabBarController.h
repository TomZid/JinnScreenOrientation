/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: JinnTabBarController.h
 **  Description: 基础标签控制器
 **
 **  Author:  jinnchang
 **  Date:    16/9/18
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import <UIKit/UIKit.h>

@interface JinnTabBarController : UITabBarController

/**
 *  改变支持的旋转方向
 *
 *  @param interfaceOrientation
 */
- (void)changeSupportedInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientationMask;

@end