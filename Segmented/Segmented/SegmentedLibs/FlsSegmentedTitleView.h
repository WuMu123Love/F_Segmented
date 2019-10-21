//
//  FlsSegmentedTitleView.h
//  Segmented
//
//  Created by fls on 2019/8/26.
//  Copyright © 2019年 fls. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FlsSegmentedTitleViewDelegate <NSObject>

-(void)SegmentedTitleViewSelectIndex:(NSInteger)SecIndex;

@end

@interface FlsSegmentedTitleView : UIView
@property(nonatomic,weak) id<FlsSegmentedTitleViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame forTitles:(NSArray *)titleArray;
//数据源
@property(nonatomic,strong) NSArray * titleItems;
//颜色
@property(nonatomic,strong) UIColor * segmentedTintColor;
//设置frame
@property(nonatomic,assign) CGRect  segmentedFrame;
//设置选中index
@property(nonatomic,assign) NSInteger selectedSegmentIndex;
//设置字体样式
@property(nonatomic,strong) NSDictionary * TitleTextAttributes;
//是否有选中的状态
@property(nonatomic,assign) BOOL momentary ;
//是否根据内容自适应选项宽度
@property(nonatomic,assign) BOOL apportionsSegmentWidthsByContent;

// 以标题的方式插入一个选项，动画可选
-(void)insertSegmentWithTitle:(nullable NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated;
// 以图片的方式插入一个选项，动画可选
-(void)insertSegmentWithImage:(nullable UIImage *)image  atIndex:(NSUInteger)segment animated:(BOOL)animated;
// 删除序号所在选项，动画可选
-(void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;
// 设置背景图
-(void)setBackgroundImage:(nullable UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
// 设置序号所在选项是否可用
-(void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;
// 设置序号所在选项宽度
-(void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment;
// 向序号所在选项设置标题,与图片的设置操作互斥
-(void)setTitle:(nullable NSString *)title forSegmentAtIndex:(NSUInteger)segment;
// 向序号所在选项设置图片,与标题的设置操作互斥(这里有个小问题就是，系统会自动将我们设置的图片格式化成系统的风格)
-(void)setImage:(nullable UIImage *)image forSegmentAtIndex:(NSUInteger)segment;
@end

NS_ASSUME_NONNULL_END
