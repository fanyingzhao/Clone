//
//  HomeView.h
//  Clone
//
//  Created by fyz on 2017/6/6.
//  Copyright © 2017年 fyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeView;
@protocol HomeViewDelegate <NSObject>
@optional
- (void)homeViewStartBtnClick:(HomeView*)homeview btn:(UIButton*)sender;
- (void)homeViewRateBtnClick:(HomeView*)homeview btn:(UIButton*)sender;
- (void)homeViewTutoritalBtnClick:(HomeView*)homeview btn:(UIButton*)sender;
- (void)homeViewFollowBtnClick:(HomeView*)homeview btn:(UIButton*)sender;

@end

@interface HomeView : UIView
@property (nonatomic, weak) id<HomeViewDelegate> delegate;

@end
