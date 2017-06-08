//
//  TaskPhotoHandler.h
//  Clone
//
//  Created by fyz on 2017/6/7.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHandler.h"

@interface TakePhotoHandler : BaseHandler

/**
 开启照相机
 */
- (void)startCamear;

/**
 拍照
 */
- (void)takePhoto:(void (^)(UIImage* image))complete;

/**
 拍摄的照片
 */
- (void)addPhotoWithImage:(UIImage*)image Alpha:(CGFloat)alpha;

/**
 更新上方拍了几张照片的指示
 */
- (void)updateIndicateLabel;

@end
