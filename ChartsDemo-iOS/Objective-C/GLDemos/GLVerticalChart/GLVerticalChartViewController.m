//
//  GLVerticalChartViewController.m
//  ChartsDemo-iOS
//
//  Created by GrayLand on 2018/12/29.
//  Copyright © 2018 dcg. All rights reserved.
//

#import "GLVerticalChartViewController.h"
#import "ChartsDemo_iOS-Swift.h"
#import "DayAxisValueFormatter.h"
#import "BPPaceLeftAxisFormatter.h"

@interface GLVerticalChartViewController ()
@property (nonatomic, strong) BarChartView *chartView;
@end

@implementation GLVerticalChartViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"速度";
    [self setupViews];
    [self setupLayouts];
    [self setDataCount:6 range:35];
}

- (void)setupViews {
    [self.view addSubview:self.chartView];
}

- (void)setupLayouts {
    [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(_chartView.superview);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.height.mas_equalTo(450);
    }];
}

//- (void)viewDidLayoutSubviews {
//    if (_chartView.data.dataSetCount > 0) {
//        [_chartView.data notifyDataChanged];
//        [_chartView notifyDataSetChanged];
//    }
//}
#pragma mark - Custom delegate

#pragma mark - Event response

#pragma mark - Private methods

- (void)setDataCount:(int)count range:(double)range {
    
    double start = 1.0;
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = start; i < start + count + 1; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(mult));
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:val]];
    }
    
    BarChartDataSet *set1 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (BarChartDataSet *)_chartView.data.dataSets[0];
        set1.values = yVals;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@"The year 2017"];
        [set1 setColors:ChartColorTemplates.material];
        set1.drawIconsEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];
        
        data.barWidth = 0.9f;
        
        _chartView.data = data;
    }
}

#pragma mark - Setter

#pragma mark - Getter

- (BarChartView *)chartView {
    if (!_chartView) {
        _chartView = [[BarChartView alloc] initWithFrame:CGRectZero];
        _chartView.chartDescription.enabled = NO;
        _chartView.drawGridBackgroundEnabled = NO;
        _chartView.dragEnabled = NO;
        [_chartView setScaleEnabled:NO];
        _chartView.pinchZoomEnabled = NO;
        
        _chartView.rightAxis.enabled = NO;
        _chartView.drawBarShadowEnabled = NO;
        _chartView.drawValueAboveBarEnabled = YES;
        
//        _chartView.maxVisibleCount = 60;
        
        ChartXAxis *xAxis = _chartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.labelFont = [UIFont systemFontOfSize:10.f];
        xAxis.drawGridLinesEnabled = NO;
        xAxis.granularity = 1.0; // only intervals of 1 day
        xAxis.labelCount = 7;
        xAxis.valueFormatter = [[DayAxisValueFormatter alloc] initForChart:_chartView];
        
        NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
        leftAxisFormatter.minimumFractionDigits = 0;
        leftAxisFormatter.maximumFractionDigits = 2;
//        leftAxisFormatter.allowsFloats
//        leftAxisFormatter.maximum = @(90);
        
//        leftAxisFormatter.negativeSuffix = @" $";
//        leftAxisFormatter.positiveSuffix = @" $";
        
        ChartYAxis *leftAxis = _chartView.leftAxis;
//        leftAxis.spaceTop = 0.5;
        leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
//        leftAxis.spaceMax = 11;
//        leftAxis.spaceMin = 90;
//        leftAxis.spaceMin = 0.2;
//        leftAxis.labelCount = 4;
//        leftAxis.spaceTop = 0.01;
//        leftAxis.spaceMin = 90;
        leftAxis.spaceMax = 90.0;
        [leftAxis setLabelCount:4 force:NO];
//        [leftAxis setLabelCount:4 force:YES];
//        leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
        leftAxis.valueFormatter = [[BPPaceLeftAxisFormatter alloc] init];
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
        leftAxis.axisLineColor = UIColor.redColor;
//        leftAxis.spaceTop = 0.15;
        leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        
        ChartYAxis *rightAxis = _chartView.rightAxis;
        rightAxis.enabled = NO;
//        rightAxis.drawGridLinesEnabled = NO;
//        rightAxis.labelFont = [UIFont systemFontOfSize:10.f];
//        rightAxis.labelCount = 8;
//        rightAxis.valueFormatter = leftAxis.valueFormatter;
//        rightAxis.spaceTop = 0.15;
//        rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        _chartView.legend.enabled = NO;
//        ChartLegend *l = _chartView.legend;
//        l.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
//        l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
//        l.orientation = ChartLegendOrientationHorizontal;
//        l.drawInside = NO;
//        l.form = ChartLegendFormSquare;
//        l.formSize = 9.0;
//        l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
//        l.xEntrySpace = 4.0;
        
//        XYMarkerView *marker = [[XYMarkerView alloc]
//                                initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
//                                font: [UIFont systemFontOfSize:12.0]
//                                textColor: UIColor.whiteColor
//                                insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)
//                                xAxisValueFormatter: _chartView.xAxis.valueFormatter];
//        marker.chartView = _chartView;
//        marker.minimumSize = CGSizeMake(80.f, 40.f);
//        _chartView.marker = marker;
        
    }
    return _chartView;
}

@end
