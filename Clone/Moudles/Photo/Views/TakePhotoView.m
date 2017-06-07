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
@property (nonatomic, strong) UIView* cameraView;
@property (nonatomic, strong) UIView* bottomView;

@end

@implementation TakePhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topView];
        [self addSubview:self.cameraView];
        [self addSubview:self.bottomView];
    }
    return self;
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
        _topView.backgroundColor = [UIColor orangeColor];
    }
    return _topView;
}

- (UIView *)cameraView {
    if (!_cameraView) {
        
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
        [_bottomView addSubview:okBtn];
    }
    return _bottomView;
}

@end
