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
    
    [self.handler startCamear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - overwrite
- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - TakePhotoViewDelegate (视图代理回调)
#pragma - 返回按钮被点击
- (void)takePhotoViewBackBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma - 照相按钮被点击
- (void)takePhotoViewCameraBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    @weakify(self);
    // 拍照
    [self.handler takePhoto:^(UIImage *image) {
        @strongify(self);
        // 将照片增加到视图中
        [self.handler addPhotoWithImage:image Alpha:0.8];
        [self.handler updateIndicateLabel];
    }];
}

#pragma - 倒计时按钮被点击
- (void)takePhotoViewTimeBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    
}

#pragma - 确定按钮被点击
- (void)takePhotoViewOkBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    
}

#pragma - 切换前后摄像头按钮被点击
- (void)takePhotoViewSwitchCameraBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    
}

#pragma - 闪光灯按钮被点击
- (void)takePhotoViewFlashBtnClick:(TakePhotoView *)view btn:(UIButton *)sender {
    
}

@end
