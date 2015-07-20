//
//  ModalViewController.m
//  ForceRotationDemo
//
//  Created by jinnchang on 15/7/19.
//  Copyright (c) 2015年 Gloomy Summer. All rights reserved.
//

#import "ModalViewController.h"

#define UISCREEN_WIDTH      MIN(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)
#define UISCREEN_HEIGHT     MAX(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)

@interface ModalViewController ()

@end

@implementation ModalViewController
{
    UIButton *backBtn;
    UIButton *forceRotationBtn;
    
    BOOL isPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    isPortrait = YES;
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    forceRotationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forceRotationBtn setTitle:@"Force Rotation" forState:UIControlStateNormal];
    [forceRotationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forceRotationBtn addTarget:self action:@selector(forceRotation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forceRotationBtn];
    
    [self viewsAutoLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewsAutoLayout
{
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_centerY);
    }];
    
    [forceRotationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_centerY);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

- (void)back
{
    /**
     *  页面关闭前将方向复原
     */
    if (!isPortrait) {
        [UIView animateWithDuration:0 animations:^{
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
            self.view.transform = CGAffineTransformIdentity;
            self.view.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, UISCREEN_WIDTH, UISCREEN_HEIGHT);
        }];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)forceRotation
{
    if (isPortrait) {
        isPortrait = NO;
        [self ForceLandscapeLeft];
    } else {
        isPortrait = YES;
        [self ForcePortrait];
    }
}

// 强制左横屏
- (void)ForceLandscapeLeft
{
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView animateWithDuration:duration animations:^{
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
        self.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
        self.view.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, UISCREEN_HEIGHT, UISCREEN_WIDTH);
    }];
}

// 强制竖屏
- (void)ForcePortrait
{
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView animateWithDuration:duration animations:^{
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        self.view.transform = CGAffineTransformIdentity;
        self.view.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, UISCREEN_WIDTH, UISCREEN_HEIGHT);
    }];
}

// 返回是否支持屏幕旋转
- (BOOL)shouldAutorotate
{
    /**
     *  要使 setStatusBarOrientation 生效，此处必须返回 NO
     */
    return NO;
}

// 返回支持的旋转方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

// 返回优先显示的屏幕方向，该方法只对 ModalViewController 有效
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end