//
//  ViewController.m
//  PieChartDemo
//
//  Created by qishang on 16/2/29.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "CustomPieChart.h"

#define kNavBarH 64.f
#define kTabBarH 49.f
#define kScreenW     [UIScreen mainScreen].bounds.size.width
#define kScreenH     [UIScreen mainScreen].bounds.size.height
//相对高度
#define kRelativeH ((kScreenH -  kNavBarH) / (568 - kNavBarH))
//相对宽度
#define kRelativeW (kScreenW / 320)

#define HexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    NSArray *items = @[
                       [PNPieChartDataItem dataItemWithValue:40 color:HexColor(0Xb96bc6) description:@"自取件"],
                       [PNPieChartDataItem dataItemWithValue:10 color:HexColor(0Xf1b870) description:@"派件"],
                       [PNPieChartDataItem dataItemWithValue:10 color:HexColor(0Xef415f) description:@"取件"],
                       [PNPieChartDataItem dataItemWithValue:40 color:HexColor(0X6041b7) description:@"自存件"],
                       
                       ];
    CustomPieChart *pieChart = [[CustomPieChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 183 * kRelativeH) / 2.0, 0, 183 * kRelativeH, 183 * kRelativeH) items:items];
    pieChart.inCircleRadius = 56 * kRelativeH;
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:10];
    [pieChart strokeChart];
    pieChart.legendFontColor = [UIColor lightGrayColor];
    pieChart.legendFont = [UIFont systemFontOfSize:10 * kRelativeW];
    UIView *legend = [pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(14 * kRelativeW, (pieChart.center.y - legend.frame.size.height / 2.0), legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    [self.view addSubview:pieChart];
    pieChart.upCenterLabel.textColor = [UIColor redColor];
    pieChart.downCenterLabel.textColor = [UIColor greenColor];
    pieChart.upCenterLabel.font = [UIFont systemFontOfSize:14 * kRelativeH];
    pieChart.downCenterLabel.font = [UIFont systemFontOfSize:17 * kRelativeH];
    pieChart.upCenterLabel.text = @"总收入";
    pieChart.downCenterLabel.text = @"￥88888";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
