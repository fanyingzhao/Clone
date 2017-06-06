//
//  BaseHandler.m
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "BaseHandler.h"

@implementation BaseHandler

- (instancetype)initWithController:(UIViewController *)controller view:(UIView *)view {
    if (self = [super init]) {
        self.controller = controller;
        self.view = view;
    }
    return self;
}

@end
