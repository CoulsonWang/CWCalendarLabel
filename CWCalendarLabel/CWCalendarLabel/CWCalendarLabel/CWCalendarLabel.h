//
//  CWCalendarLabel.h
//  CWCalendarLabel
//
//  Created by Coulson_Wang on 2017/8/5.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CWCalendarLabelScrollToTop,
    CWCalendarLabelScrollToBottom,
} CWCalendarLabelScrollDirection;

@interface CWCalendarLabel : UILabel

@property (assign, nonatomic) NSTimeInterval animateDuration;

- (void)showNextText:(NSString *)nextText withDirection:(CWCalendarLabelScrollDirection)direction;

@end
