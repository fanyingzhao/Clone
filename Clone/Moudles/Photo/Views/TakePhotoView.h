//
//  TaskPhotoView.h
//  Clone
//
//  Created by fyz on 2017/6/7.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraManager.h"

@class TakePhotoView;
@protocol TakePhotoViewDelegate <NSObject>
@optional
- (void)takePhotoViewBackBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;
- (void)takePhotoViewCameraBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;
- (void)takePhotoViewTimeBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;
- (void)takePhotoViewOkBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;
- (void)takePhotoViewSwitchCameraBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;
- (void)takePhotoViewFlashBtnClick:(TakePhotoView*)view btn:(UIButton*)sender;

@end

@interface TakePhotoView : UIView
@property (nonatomic, weak) id<TakePhotoViewDelegate> delegate;
@property (nonatomic, strong) CameraManager* cameraManager;

- (void)addPhotoWithImage:(UIImage*)image Alpha:(CGFloat)alpha;
- (void)updateIndicateLabel:(NSInteger)count;

@end
