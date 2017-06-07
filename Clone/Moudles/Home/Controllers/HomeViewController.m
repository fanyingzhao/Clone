//
//  HomeViewController.m
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "HomeHandler.h"
#import "TakePhotoViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) UIView* baseView;
@property (nonatomic, strong) HomeHandler* handler;
@end

@implementation HomeViewController

- (void)loadView {
    self.baseView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.baseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.handler = [[HomeHandler alloc] initWithController:self view:self.baseView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HomeViewDelegate
- (void)homeViewStartBtnClick:(HomeView *)homeview btn:(UIButton *)sender {
    TakePhotoViewController* vc = [[TakePhotoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)homeViewRateBtnClick:(HomeView *)homeview btn:(UIButton *)sender {
    
}

- (void)homeViewTutoritalBtnClick:(HomeView *)homeview btn:(UIButton *)sender {
    
}

- (void)homeViewFollowBtnClick:(HomeView *)homeview btn:(UIButton *)sender {
    
}

@end
