//
//  HomeViewController.m
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()
@property (nonatomic, strong) UIView* baseView;
@end

@implementation HomeViewController

- (void)loadView {
    self.baseView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.baseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
