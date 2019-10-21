//
//  ViewController.m
//  Segmented
//
//  Created by fls on 2019/8/26.
//  Copyright © 2019年 fls. All rights reserved.
//

#import "ViewController.h"
#import "FlsSegmentedTitleView.h"
#import "FlsScrollContentView.h"
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<FlsSegmentedTitleViewDelegate,FlsScrollContentViewDelegate>
@property(nonatomic,strong) FlsSegmentedTitleView * titleView ;
@property (nonatomic, strong) FlsScrollContentView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
    
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < 3; i ++) {
        UIViewController * vc = [[UIViewController alloc] init];
        switch (i) {
            case 0:
                vc.view.backgroundColor = [UIColor redColor];
                break;
            case 1:
                vc.view.backgroundColor = [UIColor yellowColor];
                break;
            case 2:
                vc.view.backgroundColor = [UIColor blueColor];
                break;
                
            default:
                break;
        }
        
        [array addObject:vc];
    }
    self.titleView.titleItems = @[@"1",@"2",@"3"];
    [self.contentView reloadViewWithChildVcs:array parentVC:nil];//要传 nil不然会出现循环引用
    self.titleView.selectedSegmentIndex = 0;
    self.contentView.currentIndex = 0;
}

- (FlsSegmentedTitleView *)titleView{
    if (!_titleView) {
//        _titleView = [[FlsSegmentedTitleView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 50)forTitles:@[@"111",@"222",@"333"]];
        _titleView = [[FlsSegmentedTitleView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 50)];

        _titleView.delegate =self;
    }
    return _titleView;
}
- (FlsScrollContentView *)contentView{
    if (!_contentView) {
       _contentView = [[FlsScrollContentView alloc] initWithFrame:CGRectMake(0, 200, SCREENWIDTH, SCREENHEIGHT-300)];
       _contentView.delegate = self;
    }
    return _contentView;
}
-(void)SegmentedTitleViewSelectIndex:(NSInteger)SecIndex{
     self.contentView.currentIndex = SecIndex;
}
- (void)contentViewDidScroll:(FlsScrollContentView *)contentView fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(float)progress{
    
}

- (void)contentViewDidEndDecelerating:(FlsScrollContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex{
     self.titleView.selectedSegmentIndex = endIndex;
}
@end
