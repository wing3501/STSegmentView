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

@property (nonatomic,strong) STSegmentView *exampleSegmentView1;
@property (nonatomic,strong) STSegmentView *exampleSegmentView2;
@property (nonatomic,strong) STSegmentView *exampleSegmentView3;
@property (nonatomic,strong) STSegmentView *exampleSegmentView4;
@property (nonatomic,strong) UIScrollView *bottomScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _exampleSegmentView1 = [[STSegmentView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 50)];
    _exampleSegmentView1.titleArray = @[@"test1",@"test2",@"test3",@"test4"];
    _exampleSegmentView1.selectedBackgroundColor = [UIColor redColor];
    _exampleSegmentView1.selectedBgViewCornerRadius = 25;
    [self.view addSubview:_exampleSegmentView1];
    
    
    _exampleSegmentView2 = [[STSegmentView alloc]initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, 50)];
    _exampleSegmentView2.titleArray = @[@"test1",@"test2",@"test3",@"test4"];
    _exampleSegmentView2.topLabelTextColor = [UIColor redColor];
    _exampleSegmentView2.bottomLabelTextColor = [UIColor blueColor];
    _exampleSegmentView2.selectedBackgroundColor = [UIColor whiteColor];
    _exampleSegmentView2.sliderColor = [UIColor blackColor];
    _exampleSegmentView2.sliderHeight = 3;
    [self.view addSubview:_exampleSegmentView2];
    
    
    _exampleSegmentView3 = [[STSegmentView alloc]initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width, 50)];
    _exampleSegmentView3.titleArray = @[@"test1",@"test2",@"test3",@"test4"];
    _exampleSegmentView3.topLabelTextColor = [UIColor redColor];
    _exampleSegmentView3.bottomLabelTextColor = [UIColor blueColor];
    _exampleSegmentView3.selectedBackgroundColor = [UIColor whiteColor];
    _exampleSegmentView3.sliderColor = [UIColor blackColor];
    _exampleSegmentView3.sliderHeight = 5;
    _exampleSegmentView3.titleSpacing = 20;
    [self.view addSubview:_exampleSegmentView3];
    
    
    _exampleSegmentView4 = [[STSegmentView alloc]initWithFrame:CGRectMake(0, 220, self.view.bounds.size.width, 60)];
    _exampleSegmentView4.delegate = self;
    _exampleSegmentView4.titleArray = @[@"test1",@"test2",@"test3",@"test4"];
    _exampleSegmentView4.titleSpacing = 20;
    _exampleSegmentView4.labelFont = [UIFont boldSystemFontOfSize:20];
    _exampleSegmentView4.bottomLabelTextColor = [UIColor blueColor];
    _exampleSegmentView4.topLabelTextColor = [UIColor redColor];
    _exampleSegmentView4.selectedBackgroundColor = [UIColor whiteColor];
    _exampleSegmentView4.selectedBgViewCornerRadius = 20;
    _exampleSegmentView4.sliderHeight = 3;
    _exampleSegmentView4.sliderColor = [UIColor blackColor];
    _exampleSegmentView4.sliderTopMargin = 5;
    _exampleSegmentView4.duration = 0.3;
    [self.view addSubview:_exampleSegmentView4];

    
    
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = self.view.frame.size.height - CGRectGetMaxY(_exampleSegmentView4.frame);
    
    _bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_exampleSegmentView4.frame), tableViewW, tableViewH)];
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
    
    
    _exampleSegmentView4.outScrollView = _bottomScrollView;
    
}


- (void)buttonClick:(NSInteger)index {
    [_bottomScrollView setContentOffset:CGPointMake(self.view.frame.size.width * index, 0) animated:YES];
}


@end
