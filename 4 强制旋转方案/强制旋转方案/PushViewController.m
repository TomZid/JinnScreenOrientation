/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: PushViewController.m
 **  Description: Push 出来的视图控制器
 **
 **  Author:  jinnchang
 **  Date:    16/9/14
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "PushViewController.h"
#import "JinnNavigationController.h"

@interface PushViewController ()

@property (nonatomic, assign) BOOL portrait;

@end

@implementation PushViewController

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
    JinnNavigationController *navigationController = (JinnNavigationController *)self.navigationController;
    [navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscapeLeft];
    
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
    JinnNavigationController *navigationController = (JinnNavigationController *)self.navigationController;
    [navigationController changeSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    
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