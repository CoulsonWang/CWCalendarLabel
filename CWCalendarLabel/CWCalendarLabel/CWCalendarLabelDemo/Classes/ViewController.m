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
    calendarLabel.text = @"99";
    calendarLabel.textAlignment = NSTextAlignmentRight;
    calendarLabel.bounds = CGRectMake(0, 0, 150, 60);
    calendarLabel.center = self.view.center;
    calendarLabel.font = [UIFont systemFontOfSize:30];
    calendarLabel.animateDuration = 0.5;
    calendarLabel.enableWhenSame = NO;
    calendarLabel.sizeToFitOn = YES;
    
    [self.view addSubview:calendarLabel];
    
    self.label = calendarLabel;
}

static int i = 99;
- (IBAction)scrollToTop:(UIButton *)sender {
    i += 1;
    NSString *str = [NSString stringWithFormat:@"%d",i];
    [self.label showNextText:str withDirection:CWCalendarLabelScrollToTop];
    
}
- (IBAction)scrollToBottom:(UIButton *)sender {
    
    i -= 1;
    NSString *str = [NSString stringWithFormat:@"%d",i];
    [self.label showNextText:str withDirection:CWCalendarLabelScrollToBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
