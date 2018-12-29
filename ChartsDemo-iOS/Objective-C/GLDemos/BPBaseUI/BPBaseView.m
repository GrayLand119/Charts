//
//  BPBaseView.m
//  BPStudentClient
//
//  Created by GrayLand on 2018/12/25.
//  Copyright © 2018 BodyPlus. All rights reserved.
//

#import "BPBaseView.h"

@implementation BPBaseView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
        [self setupLayouts];
    }
    return self;
}

- (void)setupViews {
    
}

- (void)setupLayouts {
    
}

@end
