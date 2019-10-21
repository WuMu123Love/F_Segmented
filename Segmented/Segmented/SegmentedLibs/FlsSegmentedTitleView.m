//
//  FlsSegmentedTitleView.m
//  Segmented
//
//  Created by fls on 2019/8/26.
//  Copyright © 2019年 fls. All rights reserved.
//

#import "FlsSegmentedTitleView.h"

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface FlsSegmentedTitleView()
@property(nonatomic,strong) UISegmentedControl *  segmentedControl;
@property(nonatomic,strong) NSArray * dataArray;

@end
@implementation FlsSegmentedTitleView

- (instancetype)initWithFrame:(CGRect)frame forTitles:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = titleArray;
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    self.userInteractionEnabled = YES;
    [self addSubview:self.segmentedControl];
    
}

- (UISegmentedControl *)segmentedControl{
    
    if (!_segmentedControl) {
        CGSize viewbounds = self.bounds.size;
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:self.dataArray];
        _segmentedControl.tintColor = [UIColor blueColor];
        _segmentedControl.frame = CGRectMake(10, 5, viewbounds.width-20, viewbounds.height-10);
        _segmentedControl.selectedSegmentIndex = 0;//选中第几个segment 一般用于初始化时选中
        _segmentedControl.layer.masksToBounds = YES;
        _segmentedControl.layer.cornerRadius = 3;
        //设置Segment的字体
        NSDictionary *dic = @{
                              //1.设置字体样式:例如黑体,和字体大小
                              NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:20],
                              //2.字体颜色
                              NSForegroundColorAttributeName:[UIColor redColor],
                              NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f]
                              };
        
        [_segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
        [_segmentedControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];    }
    return _segmentedControl;
}
- (void)segmentValueChanged:(UISegmentedControl *)segment{
//    NSLog(@"🌹%ld", segment.selectedSegmentIndex);
    if ([self.delegate respondsToSelector:@selector(SegmentedTitleViewSelectIndex:)]) {
        [self.delegate SegmentedTitleViewSelectIndex:segment.selectedSegmentIndex];
    }

}

#pragma mark GETTER
-(void)setTitleItems:(NSArray *)titleItems{
    _titleItems = titleItems;
    if (titleItems.count > 0) {
        [self.segmentedControl removeAllSegments];
        for (int i = 0; i < titleItems.count; i ++) {
            [self.segmentedControl insertSegmentWithTitle:titleItems[i] atIndex:i animated:NO];
        }
    }
}
- (void)setSegmentedTintColor:(UIColor *)segmentedTintColor{
    _segmentedTintColor = segmentedTintColor;
    self.segmentedControl.tintColor = segmentedTintColor;
}
- (void)setSegmentedFrame:(CGRect)segmentedFrame{
    _segmentedFrame = segmentedFrame;
    self.segmentedControl.frame = segmentedFrame;
}
- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex{
    _selectedSegmentIndex = selectedSegmentIndex;
    self.segmentedControl.selectedSegmentIndex = selectedSegmentIndex;
}
- (void)setTitleTextAttributes:(NSDictionary *)TitleTextAttributes{
    _TitleTextAttributes  = TitleTextAttributes;
    [self.segmentedControl setTitleTextAttributes:TitleTextAttributes forState:UIControlStateNormal];
}
- (void)setMomentary:(BOOL)momentary{
    _momentary = momentary;
    self.segmentedControl.momentary = momentary;
}
- (void)setApportionsSegmentWidthsByContent:(BOOL)apportionsSegmentWidthsByContent{
    _apportionsSegmentWidthsByContent = apportionsSegmentWidthsByContent;
    self.segmentedControl.apportionsSegmentWidthsByContent = apportionsSegmentWidthsByContent;
}

// 以标题的方式插入一个选项，动画可选
-(void)insertSegmentWithTitle:(nullable NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated;{
    [self.segmentedControl insertSegmentWithTitle:title atIndex:segment animated:animated];
}
// 以图片的方式插入一个选项，动画可选
-(void)insertSegmentWithImage:(nullable UIImage *)image  atIndex:(NSUInteger)segment animated:(BOOL)animated;{
    [self.segmentedControl insertSegmentWithImage:image atIndex:segment animated:animated];
}
// 删除序号所在选项，动画可选
-(void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;{
    [self.segmentedControl removeSegmentAtIndex:segment animated:animated];
}
// 设置背景图
-(void)setBackgroundImage:(nullable UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;{
    [self.segmentedControl setBackgroundImage:backgroundImage forState:state barMetrics:barMetrics];
}
// 设置序号所在选项是否可用
-(void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;{
    [self.segmentedControl setEnabled:enabled forSegmentAtIndex:segment];
}
// 设置序号所在选项宽度
-(void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment;{
     [self.segmentedControl setWidth:width forSegmentAtIndex:segment];
}
// 向序号所在选项设置标题,与图片的设置操作互斥
-(void)setTitle:(nullable NSString *)title forSegmentAtIndex:(NSUInteger)segment;{
    [self.segmentedControl setTitle:title forSegmentAtIndex:segment];
}
// 向序号所在选项设置图片,与标题的设置操作互斥(这里有个小问题就是，系统会自动将我们设置的图片格式化成系统的风格)
-(void)setImage:(nullable UIImage *)image forSegmentAtIndex:(NSUInteger)segment;{
    [self.segmentedControl setImage:image forSegmentAtIndex:segment];
}


@end
