//
//  BaseNavigationController.m
//  Clone
//
//  Created by fan on 2017/6/8.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (UIViewController*)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
