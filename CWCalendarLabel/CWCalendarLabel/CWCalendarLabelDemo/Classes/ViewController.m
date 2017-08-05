//
//  ViewController.m
//  CWCalendarLabel
//
//  Created by Coulson_Wang on 2017/8/5.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import "ViewController.h"
#import "CWCalendarLabel.h"

@interface ViewController ()

@property (weak, nonatomic) CWCalendarLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CWCalendarLabel *calendarLabel = [[CWCalendarLabel alloc] init];
    calendarLabel.text = @"www";
    [calendarLabel sizeToFit];
    
    
    calendarLabel.center = self.view.center;
    
//    calendarLabel.frame = CGRectMake(0, 0, 200, 30);
    
    [self.view addSubview:calendarLabel];
    
    self.label = calendarLabel;
}

- (IBAction)scrollToTop:(UIButton *)sender {
    [self.label showNextText:@"xxx" withDirection:CWCalendarLabelScrollToTop];
    
}
- (IBAction)scrollToBottom:(UIButton *)sender {
    [self.label showNextText:@"zzz" withDirection:CWCalendarLabelScrollToBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
