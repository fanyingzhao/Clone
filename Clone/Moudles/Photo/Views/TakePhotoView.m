//
//  TaskPhotoView.m
//  Clone
//
//  Created by fyz on 2017/6/7.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "TakePhotoView.h"

@interface TakePhotoView ()
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UILabel* indicateLabel;

@property (nonatomic, strong) UIView* cameraView;
@property (nonatomic, strong) UIView* bottomView;


@end

@implementation TakePhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topView];
        [self addSubview:self.bottomView];
        [self addSubview:self.cameraView];
    }
    return self;
}

#pragma mark - funcs
- (void)addPhotoWithImage:(UIImage *)image Alpha:(CGFloat)alpha {
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.cameraView.frame];
    imageView.image = image;
    imageView.alpha = alpha;
    
    [self addSubview:imageView];
}

- (void)updateIndicateLabel:(NSInteger)count {
    self.indicateLabel.text = [NSString stringWithFormat:@"%ld",count];
}

#pragma mark - events
- (void)backBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewBackBtnClick:btn:)]) {
        [self.delegate takePhotoViewBackBtnClick:self btn:sender];
    }
}

- (void)cameraBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewCameraBtnClick:btn:)]) {
        [self.delegate takePhotoViewCameraBtnClick:self btn:sender];
    }
}

- (void)timeBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewTimeBtnClick:btn:)]) {
        [self.delegate takePhotoViewTimeBtnClick:self btn:sender];
    }
}

- (void)okBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewOkBtnClick:btn:)]) {
        [self.delegate takePhotoViewOkBtnClick:self btn:sender];
    }
}

- (void)switchCameraBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewSwitchCameraBtnClick:btn:)]) {
        [self.delegate takePhotoViewSwitchCameraBtnClick:self btn:sender];
    }
}

- (void)flashBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhotoViewFlashBtnClick:btn:)]) {
        [self.delegate takePhotoViewFlashBtnClick:self btn:sender];
    }
}

#pragma mark - getter
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:({
            CGRect rect = CGRectZero;
            rect.origin.x = 0;
            rect.origin.y = 0;
            rect.size.width = CGRectGetWidth(self.bounds);
            rect.size.height = 50;
            rect;
        })];
        _topView.backgroundColor = UICOLOR_RGB(53, 56, 61);
        
        UIImageView* indicateImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera_circle_times"]];
        [indicateImageView sizeToFit];
        indicateImageView.left = 10;
        indicateImageView.centerY = _topView.centerY;
        
        UILabel* label = [[UILabel alloc] initWithFrame:indicateImageView.frame];
        label.textColor = [UIColor whiteColor];
        label.text = @"0";
        label.textAlignment = NSTextAlignmentCenter;
        _indicateLabel = label;
        
        UIButton* cameraFontBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cameraFontBtn setImage:[UIImage imageNamed:@"camera_front"] forState:UIControlStateNormal];
        [cameraFontBtn sizeToFit];
        cameraFontBtn.centerX = _topView.centerX;
        cameraFontBtn.centerY = indicateImageView.centerY;
        [cameraFontBtn addTarget:self action:@selector(switchCameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton* flashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [flashBtn setImage:[UIImage imageNamed:@"camera_flash_off"] forState:UIControlStateNormal];
        [flashBtn sizeToFit];
        flashBtn.right = _topView.width - indicateImageView.left;
        flashBtn.centerY = indicateImageView.centerY;
        [flashBtn addTarget:self action:@selector(flashBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_topView addSubview:indicateImageView];
        [_topView addSubview:label];
        [_topView addSubview:cameraFontBtn];
        [_topView addSubview:cameraFontBtn];
        [_topView addSubview:flashBtn];
    }
    return _topView;
}

- (UIView *)cameraView {
    if (!_cameraView) {
        _cameraView = [[UIView alloc] initWithFrame:({
            CGRect rect = CGRectZero;
            rect.origin.x = 0;
            rect.origin.y = self.topView.bottom;
            rect.size.width = self.width;
            rect.size.height = self.bottomView.top - CGRectGetMinY(rect);
            rect;
        })];
        _cameraView.backgroundColor = [UIColor orangeColor];
    }
    return _cameraView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:({
            CGRect rect = CGRectZero;
            rect.size.width = CGRectGetWidth(self.bounds);
            rect.size.height = 100;
            rect.origin.x = 0;
            rect.origin.y = CGRectGetHeight(self.bounds) - CGRectGetHeight(rect);
            rect;
        })];
        _bottomView.backgroundColor = [UIColor colorWithRed:53.f / 255 green:56.f / 255 blue:61.f / 255 alpha:1];
        
        UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"common_back"] forState:UIControlStateNormal];
        [backBtn sizeToFit];
        backBtn.frame = ({
            CGRect rect = CGRectZero;
            rect.size = backBtn.bounds.size;
            rect.origin.x = 0;
            rect.origin.y = (CGRectGetHeight(_bottomView.bounds) - CGRectGetHeight(rect)) / 2;
            rect;
        });
        [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:backBtn];
        
        UIButton* cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cameraBtn setImage:[UIImage imageNamed:@"camera_shot"] forState:UIControlStateNormal];
        [cameraBtn sizeToFit];
        cameraBtn.frame = ({
            CGRect rect = CGRectZero;
            rect.size = cameraBtn.bounds.size;
            rect.origin.x = (CGRectGetWidth(_bottomView.bounds) - CGRectGetWidth(rect)) / 2;
            rect.origin.y = (CGRectGetHeight(_bottomView.bounds) - CGRectGetHeight(rect)) / 2;
            rect;
        });
        [cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:cameraBtn];
        
        UIButton* timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [timeBtn setImage:[UIImage imageNamed:@"camera_time2"] forState:UIControlStateNormal];
        [timeBtn sizeToFit];
        timeBtn.frame = ({
            CGRect rect = CGRectZero;
            rect.size = timeBtn.bounds.size;
            rect.origin.x = CGRectGetMaxX(cameraBtn.frame) + 20;
            rect.origin.y = (CGRectGetHeight(_bottomView.bounds) - CGRectGetHeight(rect)) / 2;
            rect;
        });
        [_bottomView addSubview:timeBtn];
        
        UIButton* okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [okBtn setImage:[UIImage imageNamed:@"common_done"] forState:UIControlStateNormal];
        [okBtn sizeToFit];
        okBtn.frame = ({
            CGRect rect = CGRectZero;
            rect.size = okBtn.bounds.size;
            rect.origin.x = CGRectGetWidth(_bottomView.bounds) - CGRectGetWidth(rect);
            rect.origin.y = (CGRectGetHeight(_bottomView.bounds) - CGRectGetHeight(rect)) / 2;
            rect;
        });
        [okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:okBtn];
    }
    return _bottomView;
}

- (CameraManager *)cameraManager {
    if (!_cameraManager) {
        _cameraManager = [[CameraManager alloc] initWithSession:nil];
        _cameraManager.attachPreview = self.cameraView;
    }
    return _cameraManager;
}


@end
