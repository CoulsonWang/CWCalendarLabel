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
    [calendarLabel sizeToFit];
    
    
    calendarLabel.center = self.view.center;
    
//    calendarLabel.frame = CGRectMake(0, 0, 200, 30);
    
    [self.view addSubview:calendarLabel];
    
    self.label = calendarLabel;
}

- (IBAction)scrollToTop:(UIButton *)sender {

    NSString *str = [NSString stringWithFormat:@"%ld",self.label.text.integerValue + 1];
    [self.label showNextText:str withDirection:CWCalendarLabelScrollToTop];
    
}
- (IBAction)scrollToBottom:(UIButton *)sender {
    static int i = 99;
    i -= 1;
    NSString *str = [NSString stringWithFormat:@"%d",i];
    [self.label showNextText:str withDirection:CWCalendarLabelScrollToBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
