//
//  BaseHandler.h
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseHandler : NSObject
@property (nonatomic, assign) UIViewController* controller;
@property (nonatomic, assign) UIView* view;

- (instancetype)initWithController:(UIViewController*)controller view:(UIView*)view;

@end
