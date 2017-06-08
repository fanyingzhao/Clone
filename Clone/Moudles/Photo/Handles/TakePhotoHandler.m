//
//  TaskPhotoHandler.m
//  Clone
//
//  Created by fyz on 2017/6/7.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "TakePhotoHandler.h"
#import "TakePhotoView.h"
#import "TakePhotoViewController.h"

@interface TakePhotoHandler ()
@property (nonatomic, weak) TakePhotoView* view;
@property (nonatomic, weak) TakePhotoViewController* controller;

@property (nonatomic, strong) NSMutableArray* imageList;

@end

@implementation TakePhotoHandler
@dynamic view, controller;

- (instancetype)initWithController:(TakePhotoViewController *)controller view:(TakePhotoView *)view {
    if (self = [super initWithController:controller view:view]) {
        view.delegate = controller;
        
        self.imageList = [NSMutableArray array];
    }
    return self;
}

#pragma mark - funcs
- (void)startCamear {
    [self.view.cameraManager start];
}

- (void)takePhoto:(void (^)(UIImage *))complete {
    [self.view.cameraManager shutterCameraWithImageHandle:^(UIImage *image) {
        if (complete) {
            complete(image);
        }
    }];
}

- (void)addPhotoWithImage:(UIImage*)image Alpha:(CGFloat)alpha {
    if (!self.imageList.count) {
        [self.view addPhotoWithImage:image Alpha:alpha];
    }
    
    [self.imageList addObject:image];
}

- (void)updateIndicateLabel {
    [self.view updateIndicateLabel:self.imageList.count];
}

@end
