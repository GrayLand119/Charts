//
//  GLCustomLineChartVC.m
//  ChartsDemo
//
//  Created by GrayLand on 2017/11/30.
//  Copyright © 2017年 dcg. All rights reserved.
//

#import "GLCustomLineChartVC.h"
#import <Charts/Charts.h>


@interface GLCustomLineChartVC ()
<ChartViewDelegate,IChartAxisValueFormatter>

@property (nonatomic, strong) LineChartView *chartView;

@property (nonatomic, strong) NSMutableArray *allData;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSDate *startDate;
@end

@implementation GLCustomLineChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _chartView = [[LineChartView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_chartView];
    
    _chartView.delegate = self;
    
    _chartView.chartDescription.enabled = NO;
    
    _chartView.leftAxis.enabled = YES;
    
    _chartView.rightAxis.enabled = NO;
    
    _chartView.xAxis.axisLineColor        = [UIColor blackColor];
    _chartView.xAxis.drawAxisLineEnabled  = YES;
    _chartView.xAxis.drawGridLinesEnabled = NO;
    _chartView.xAxis.labelPosition        = XAxisLabelPositionBottom;
    _chartView.xAxis.valueFormatter       = self;
    _chartView.drawGridBackgroundEnabled  = NO;
    _chartView.drawBordersEnabled         = NO;
    _chartView.dragEnabled                = YES;
    _chartView.highlightPerTapEnabled     = NO;
    _chartView.legend.enabled             = NO;
    _chartView.highlightPerTapEnabled     = NO;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled           = NO;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSLocalDomainMask, YES) firstObject];
    NSString *file = [path stringByAppendingPathComponent:@"simulate.dat"];
    NSUInteger size = [[[NSFileManager defaultManager] attributesOfItemAtPath:file error:nil] fileSize];
    NSLog(@"size:%@KB", @(size/1024.0));
    
    _allData = [NSMutableArray arrayWithContentsOfFile:file];
    BOOL enable = NO;
    enable = YES;
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    _chartView.xAxis.valueFormatter = self;
    
    _startDate = [_formatter dateFromString:@"2017-11-30 00:00:00"];
    if (!_allData.count || enable) {
        _allData = [NSMutableArray arrayWithCapacity:(NSUInteger)time];
        [_allData addObjectsFromArray:[self simulatorHeartRateWithStart:_startDate
                                                                    end:[_formatter dateFromString:@"2017-11-30 01:00:00"]]];
        [_allData writeToFile:file atomically:YES];
    }
    NSLog(@"_allData Count:%@]", @(_allData.count));
    
    NSMutableArray <LineChartDataSet *> *dataSets = [[NSMutableArray alloc] init];
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    NSMutableArray *valuesB = [[NSMutableArray alloc] init];
    NSMutableArray *valuesC = [[NSMutableArray alloc] init];
//    BOOL breakPoint;
    CGFloat lastValue = 0;
    NSMutableDictionary *breakDict = [NSMutableDictionary dictionary];
    NSMutableArray *breakDictArray = [NSMutableArray array];
    BOOL isFirstBreak = YES;
    for (NSUInteger i = 0; i < _allData.count; i++) {
        if (i < 500 || (i > 1000 && i < 1500) || (i > 2800)) {
            lastValue = [_allData[i] intValue];
            if (!isFirstBreak) {
                isFirstBreak = YES;
                breakDict[@"eX"] = @(i);
                breakDict[@"eY"] = @(lastValue);
                [breakDictArray addObject:[breakDict copy]];
            }
            if (i < 500) {
                ChartDataEntry *charEntry = [[ChartDataEntry alloc] initWithX:i y:lastValue];
                [values addObject:charEntry];
                continue;
            }
            if (i > 1000 && i < 1500) {
                ChartDataEntry *charEntry = [[ChartDataEntry alloc] initWithX:i y:lastValue];
                [valuesB addObject:charEntry];
                continue;
            }
            if (i > 2800) {
                ChartDataEntry *charEntry = [[ChartDataEntry alloc] initWithX:i y:lastValue];
                [valuesC addObject:charEntry];
                continue;
            }
        }else {
            if (isFirstBreak) {
                isFirstBreak = NO;
                breakDict[@"sX"] = @(i);
                breakDict[@"sY"] = @(lastValue);
                lastValue = 0;
            }
        }
    }
    
    if (breakDictArray.count) {
        for (int i = 0; i < breakDictArray.count; i++) {
            NSDictionary *tDict = breakDictArray[i];
            CGFloat sX = [tDict[@"sX"] floatValue];
            CGFloat sY = [tDict[@"sY"] floatValue];
            CGFloat eX = [tDict[@"eX"] floatValue];
            CGFloat eY = [tDict[@"eY"] floatValue];
            
            CGFloat difY   = eY - sY;
            int difX = (eX - sX);
            CGFloat perAdd = difY / difX;
            NSMutableArray *valuesEmpty = [[NSMutableArray alloc] init];
            for (int j = sX; j < eX; j++) {
                float tV = sY + perAdd * (j - sX);
                ChartDataEntry *charEntry = [[ChartDataEntry alloc] initWithX:j y:tV];
                [valuesEmpty addObject:charEntry];
            }
            LineChartDataSet *d = [[LineChartDataSet alloc] initWithValues:valuesEmpty label:nil];
            //        d.lineWidth = 1.0;
            d.lineDashPhase = 1.0;
            d.lineDashLengths = @[@(3),@(3)];
            d.drawCirclesEnabled = NO;
            d.drawCircleHoleEnabled = NO;
            [d setColor:[UIColor blackColor]];
            [dataSets addObject:d];
        }
    }

    {
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithValues:values label:nil];
        d.lineWidth = 1.0;
        d.drawCirclesEnabled = NO;
        d.drawCircleHoleEnabled = NO;
        [d setColor:[UIColor blackColor]];
        [dataSets addObject:d];
    }
    {
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithValues:valuesB label:nil];
        d.lineWidth = 1.0;
        d.drawCirclesEnabled = NO;
        d.drawCircleHoleEnabled = NO;
        [d setColor:[UIColor blackColor]];
        [dataSets addObject:d];
    }
    {
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithValues:valuesC label:nil];
        d.lineWidth = 1.0;
        d.drawCirclesEnabled = NO;
        d.drawCircleHoleEnabled = NO;
        [d setColor:[UIColor blackColor]];
        [dataSets addObject:d];
    }
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:7.f]];
    _chartView.xAxis.axisMinimum = -180;
//    _chartView.xAxis.axisMaximum = 2000;
    _chartView.data = data;
    [_chartView zoomWithScaleX:1.0 scaleY:1.0 x:0 y:0];
}

- (NSArray *)simulatorHeartRateWithStart:(NSDate *)start end:(NSDate *)end {
    
    NSTimeInterval time = [end timeIntervalSinceDate:start];
    NSMutableArray *tArray = [NSMutableArray arrayWithCapacity:(NSUInteger)(time)];
    static int v = 0;
    for (int i = 0; i < time; i++) {
        v = sin(i/50.0f) * 50 + 110;
        [tArray addObject:@(v)];

    }
    
    return tArray;
}

#pragma mark - ChartViewDelegate

#pragma mark - IChartAxisValueFormatter
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    NSDate *vDate = [NSDate dateWithTimeInterval:value sinceDate:_startDate];
    [_formatter setDateFormat:@"HH:mm"];
    NSString *str = [_formatter stringFromDate:vDate];
    return str;
}

@end
