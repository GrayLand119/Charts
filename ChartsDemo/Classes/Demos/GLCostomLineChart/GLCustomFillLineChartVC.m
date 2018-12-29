//
//  GLCustomFillLineChartVC.m
//  ChartsDemo
//
//  Created by GrayLand on 2017/12/13.
//  Copyright © 2017年 dcg. All rights reserved.
//

#import "GLCustomFillLineChartVC.h"
#import <Charts/Charts.h>

@interface GLCustomFillLineChartVC ()
<ChartViewDelegate,IChartAxisValueFormatter>

@property (nonatomic, strong) LineChartView *chartView;
@property (nonatomic, strong) NSMutableArray *allData;

@end

@implementation GLCustomFillLineChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _chartView = [[LineChartView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_chartView];
    
    _chartView.delegate = self;
    _chartView.chartDescription.enabled = NO;
    _chartView.rightAxis.enabled = NO;
    _chartView.drawGridBackgroundEnabled  = NO;
    _chartView.drawBordersEnabled         = NO;
    _chartView.legend.enabled             = NO;
    _chartView.dragEnabled                = YES;
    _chartView.highlightPerTapEnabled     = NO;
    _chartView.pinchZoomEnabled           = NO;
    [_chartView setScaleEnabled:YES];
    
    _chartView.leftAxis.enabled = YES;
    _chartView.xAxis.axisLineColor        = [UIColor blackColor];
    _chartView.xAxis.drawAxisLineEnabled  = YES;
    _chartView.xAxis.drawGridLinesEnabled = NO;
    _chartView.xAxis.labelPosition        = XAxisLabelPositionBottom;
    _chartView.xAxis.valueFormatter       = self;
    
    _allData = [self simulateAllData];
    
    
    
//    ChartData *chartData = [ChartData alloc] initWithDataSet:<#(id<IChartDataSet> _Nullable)#>
//    _chartView.data =
}

- (NSMutableArray *)simulateAllData {
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [datas addObject:@(arc4random_uniform(50) + 50)];
    }
    return datas;
}

@end
