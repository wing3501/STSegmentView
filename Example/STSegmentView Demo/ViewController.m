//
//  ViewController.m
//  STSegmentView
//
//  Created by styf on 2017/6/15.
//  Copyright © 2017年 styf. All rights reserved.
//

#import "ViewController.h"
#import "STSegmentView.h"
@interface ViewController ()<UIScrollViewDelegate,STSegmentViewDelegate>

@property (nonatomic,strong) STSegmentView *v;

@property (nonatomic,strong) UIScrollView *bottomScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _v = [[STSegmentView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 60)];
    _v.delegate = self;
    _v.titleArray = @[@"测试1",@"测试2",@"测试3",@"测试4"];
    _v.titleSpacing = 20;
    _v.labelFont = [UIFont boldSystemFontOfSize:20];
    _v.bottomLabelTextColor = [UIColor blueColor];
    _v.topLabelTextColor = [UIColor redColor];
    _v.selectedBackgroundColor = [UIColor whiteColor];
    _v.selectedBgViewCornerRadius = 20;
    _v.sliderHeight = 3;
    _v.sliderColor = [UIColor blackColor];
    _v.sliderTopMargin = 5;
    _v.duration = 0.3;
    [self.view addSubview:_v];

    
    
    
    
    
    
    
    
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = self.view.frame.size.height - CGRectGetMaxY(_v.frame);
    
    _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_v.frame), tableViewW, tableViewH)];
    _bottomScrollView.delegate = self;
    _bottomScrollView.backgroundColor = [UIColor yellowColor];
    _bottomScrollView.contentSize = CGSizeMake(tableViewW * 4, tableViewH);
    _bottomScrollView.pagingEnabled = YES;
    [self.view addSubview:_bottomScrollView];
    
    NSArray *color = @[[UIColor greenColor],[UIColor yellowColor],[UIColor brownColor],[UIColor purpleColor]];
    for (int i = 0; i < 4; i++) {
        UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(i * tableViewW, 0, tableViewW, tableViewH)];
        vv.backgroundColor = color[i];
        [_bottomScrollView addSubview:vv];
    }
    
    
    _v.outScrollView = _bottomScrollView;
    
}


- (void)buttonClick:(NSInteger)index {
    [_bottomScrollView setContentOffset:CGPointMake(self.view.frame.size.width * index, 0) animated:YES];
}


@end
