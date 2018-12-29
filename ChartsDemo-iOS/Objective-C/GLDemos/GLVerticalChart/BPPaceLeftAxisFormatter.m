//
//  BPPaceLeftAxisFormatter.m
//  ChartsDemo-iOS
//
//  Created by GrayLand on 2018/12/29.
//  Copyright © 2018 dcg. All rights reserved.
//

#import "BPPaceLeftAxisFormatter.h"

@implementation BPPaceLeftAxisFormatter

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    int min = floor(value / 60.0);
    int sec = (int)(value) % 60;
    
    return [NSString stringWithFormat:@"%02d'%02d\"", min, sec];
}

@end
