//
//  CustomPieChart.m
//  CloudStation
//
//  Created by Rain on 16/2/28.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import "CustomPieChart.h"
#import <Masonry.h>

#define kRelativeH [UIScreen mainScreen].bounds.size.height / 568.0
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@implementation CustomPieChart
- (id)initWithFrame:(CGRect)frame items:(NSArray *)items {
    if (self = [super initWithFrame:frame items:items]) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI {
    WS(mySelf);
    self.upCenterLabel = [[UILabel alloc] init];
    [self addSubview:self.upCenterLabel];
    UIView *centerLine = [[UIView alloc] init];
    [self addSubview:centerLine];
    [centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(mySelf);
        make.height.equalTo(@0);
    }];
    self.upCenterLabel.textAlignment = NSTextAlignmentCenter;
//    self.upCenterLabel.backgroundColor = [UIColor cyanColor];
    [self.upCenterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(centerLine.mas_top).offset(-3 * kRelativeH);
        make.centerX.equalTo(mySelf);
        
    }];
    self.downCenterLabel = [[UILabel alloc] init];
    self.downCenterLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.downCenterLabel];
//    self.downCenterLabel.backgroundColor = [UIColor redColor];
    [self.downCenterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerLine.mas_bottom).offset(3 * kRelativeH);
        make.centerX.equalTo(mySelf);
    }];
    
}
- (void)recompute {
    self.outerCircleRadius = CGRectGetWidth(self.bounds) / 2;
    self.innerCircleRadius = self.inCircleRadius;
//
}

@end
