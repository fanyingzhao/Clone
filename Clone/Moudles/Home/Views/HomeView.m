//
//  HomeView.m
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "HomeView.h"

#define Bottom_Image     @"bottom_image"

@interface HomeView ()
@property (nonatomic, strong) UIButton* startBtn;
@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) NSArray* bottomData;
@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.bottomData = @[@{Bottom_Image : @"home_rate"},
                            @{Bottom_Image : @"home_tutorial"},
                            @{Bottom_Image : @"home_follow"}];
        
        [self addSubview:self.startBtn];
        [self addSubview:self.bottomView];
    }
    return self;
}

#pragma mark - events
- (void)startBtnClick:(UIButton*)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeViewStartBtnClick:btn:)]) {
        [self.delegate homeViewStartBtnClick:self btn:sender];
    }
}

- (void)btnClick:(UIButton*)sender {
    switch (self.tag - 100) {
        case 0: {
            if (self.delegate && [self.delegate respondsToSelector:@selector(homeViewRateBtnClick:btn:)]) {
                [self.delegate homeViewRateBtnClick:self btn:sender];
            }
        }
            break;
        case 1: {
            if (self.delegate && [self.delegate respondsToSelector:@selector(homeViewTutoritalBtnClick:btn:)]) {
                [self.delegate homeViewTutoritalBtnClick:self btn:sender];
            }
        }
            break;
        case 2: {
            if (self.delegate && [self.delegate respondsToSelector:@selector(homeViewFollowBtnClick:btn:)]) {
                [self.delegate homeViewFollowBtnClick:self btn:sender];
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - tools
- (UIView*)createBottomWithDic:(NSDictionary*)dic index:(NSInteger)index {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = ({
        CGRect rect = CGRectZero;
        rect.size.width = CGRectGetWidth(self.bounds) / self.bottomData.count;
        rect.size.height = CGRectGetHeight(self.bottomView.bounds);
        rect.origin.x = index * CGRectGetWidth(rect);
        rect.origin.y = 0;
        rect;
    });
    [btn setImage:[UIImage imageNamed:dic[Bottom_Image]] forState:UIControlStateNormal];
    btn.tag = index + 100;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - getter
- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setImage:[UIImage imageNamed:@"home_start"] forState:UIControlStateNormal];
        [_startBtn sizeToFit];
        _startBtn.frame = ({
            CGRect rect = CGRectZero;
            rect.size = _startBtn.bounds.size;
            rect.origin.x = (CGRectGetWidth(self.bounds) - CGRectGetWidth(_startBtn.bounds)) / 2;
            rect.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(_startBtn.bounds)) / 2 - 100;
            rect;
        });
        [_startBtn addTarget:self action:@selector(startBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:({
            CGRect rect = CGRectZero;
            rect.size.width = CGRectGetWidth(self.bounds);
            rect.size.height = 50;
            rect.origin.x = 0;
            rect.origin.y = CGRectGetHeight(self.bounds) - CGRectGetHeight(rect);
            rect;
        })];
        
        for (NSInteger i = 0; i < self.bottomData.count; i ++) {
            [_bottomView addSubview:[self createBottomWithDic:self.bottomData[i] index:i]];
        }
        
    }
    return _bottomView;
}

@end
