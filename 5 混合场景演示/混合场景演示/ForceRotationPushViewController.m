/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: ForceRotationPushViewController.m
 **  Description: 手动强制旋转 Push 出来的视图控制器
 **
 **  Author:  jinnchang
 **  Date:    16/9/18
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "ForceRotationPushViewController.h"
#import "JinnTabBarController.h"

@interface ForceRotationPushViewController ()

@property (nonatomic, assign) BOOL portrait;

@end

@implementation ForceRotationPushViewController

#pragma mark - Override

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
        [self.navigationItem setHidesBackButton:YES animated:YES];
    }
    else
    {
        [self setPortrait:YES];
        [self forcePortrait];
        [self.navigationItem setHidesBackButton:NO animated:YES];
    }
}

#pragma mark - Private

/**
 *  强制左横屏
 */
- (void)forceLandscapeLeft
{
    JinnTabBarController *tabBarController = (JinnTabBarController *)self.tabBarController;
    [tabBarController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscapeLeft];
    
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
    JinnTabBarController *tabBarController = (JinnTabBarController *)self.tabBarController;
    [tabBarController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    
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