//
//  CustomPieChart.h
//  CloudStation
//
//  Created by Rain on 16/2/28.
//  Copyright © 2016年 Rain. All rights reserved.
//

#import <PNChart/PNChart.h>

@interface CustomPieChart : PNPieChart
@property (nonatomic, assign) CGFloat inCircleRadius;
@property (nonatomic, strong) UILabel *upCenterLabel;
@property (nonatomic, strong) UILabel *downCenterLabel;
- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;
@end
