/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: ViewController.m
 **  Description: 
 **
 **  History
 **  -----------------------------------------------------------------------------------------------
 **  Author: jinnchang
 **  Date: 16/7/20
 **  Version: 1.0.0
 **  Remark: Create
 **************************************************************************************************/

#import "ViewController.h"
#import "PresentViewController.h"
#import "PushViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Present"
                                                                               style:UIBarButtonItemStylePlain
                                                                              target:self
                                                                              action:@selector(present)]];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                                                                style:UIBarButtonItemStylePlain
                                                                               target:self
                                                                               action:@selector(push)]];
    
    self.title = @"限制为横屏或者竖屏，不能旋转";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)present
{
    [self presentViewController:[[PresentViewController alloc] init] animated:YES completion:nil];
}

- (void)push
{
    [self.navigationController pushViewController:[[PushViewController alloc] init] animated:YES];
}

@end