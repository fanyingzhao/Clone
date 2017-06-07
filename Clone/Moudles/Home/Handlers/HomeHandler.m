//
//  HomeHandler.m
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import "HomeHandler.h"
#import "HomeView.h"
#import "HomeViewController.h"

@interface HomeHandler ()
@property (nonatomic, weak) HomeView* view;
@property (nonatomic, weak) HomeViewController* controller;
@end

@implementation HomeHandler
@dynamic view, controller;

- (instancetype)initWithController:(HomeViewController *)controller view:(UIView *)view {
    if (self = [super initWithController:controller view:view]) {
        self.view.delegate = controller;
    }
    return self;
}

@end
