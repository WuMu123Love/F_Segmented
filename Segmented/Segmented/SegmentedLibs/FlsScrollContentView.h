//
//  FlsScrollContentView.h
//  Segmented
//
//  Created by fls on 2019/8/26.
//  Copyright © 2019年 fls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FlsScrollContentView;

@protocol FlsScrollContentViewDelegate <NSObject>

@optional

- (void)contentViewDidScroll:(FlsScrollContentView *)contentView fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(float)progress;

- (void)contentViewDidEndDecelerating:(FlsScrollContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

@end
@interface FlsScrollContentView : UIView
/**
 加载滚动视图的界面
 
 @param childVcs 当前View需要装入的控制器集合
 @param parentVC 当前View所在的父控制器
 */
- (void)reloadViewWithChildVcs:(NSArray<UIViewController *> *)childVcs parentVC:(UIViewController *)parentVC;

@property (nonatomic, weak) id<FlsScrollContentViewDelegate> delegate;

/**
 设置当前滚动到第几个页面，默认为第0页
 */
@property (nonatomic, assign) NSInteger currentIndex;
@end

NS_ASSUME_NONNULL_END
