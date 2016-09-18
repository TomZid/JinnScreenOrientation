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

@interface PresentViewController ()

@end

@implementation PresentViewController

#pragma mark - IBAction

- (IBAction)backButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end