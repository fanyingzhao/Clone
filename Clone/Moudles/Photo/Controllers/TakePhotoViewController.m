//
//  TakePhotoViewController.m
//  Clone
//
//  Created by fyz on 2017/6/7.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "TakePhotoViewController.h"
#import "TakePhotoView.h"
#import "TakePhotoHandler.h"

@interface TakePhotoViewController ()
@property (nonatomic, strong) TakePhotoView* baseView;
@property (nonatomic, strong) TakePhotoHandler* handler;
@end

@implementation TakePhotoViewController

- (void)loadView {
    self.view = self.baseView = [[TakePhotoView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.handler = [[TakePhotoHandler alloc] initWithController:self view:self.baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
