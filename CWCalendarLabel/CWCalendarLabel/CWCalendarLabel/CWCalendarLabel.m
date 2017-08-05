//
//  CWCalendarLabel.m
//  CWCalendarLabel
//
//  Created by Coulson_Wang on 2017/8/5.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import "CWCalendarLabel.h"

#define kWidth self.bounds.size.width
#define kHeight self.bounds.size.height

typedef enum : NSUInteger {
    CWCalendarLabelPositionTop,
    CWCalendarLabelPositionBottom,
} CWCalendarLabelPosition;

@interface CWCalendarLabel ()

@property (weak, nonatomic) UILabel *nextTextLabel;

@end

@implementation CWCalendarLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.animateDuration = 0.5;
    }
    return self;
}

// 核心方法
- (void)showNextText:(NSString *)nextText withDirection:(CWCalendarLabelScrollDirection)direction {
    CWCalendarLabelPosition position = (direction == CWCalendarLabelPositionTop) ? CWCalendarLabelPositionBottom : CWCalendarLabelPositionTop;
    [self addNextTextLabelWithText:nextText atPosition:position];
    CGFloat translantionY = (position == CWCalendarLabelPositionTop) ? kHeight : -kHeight;
    [UIView animateWithDuration:self.animateDuration animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, translantionY);
        self.alpha = 0;
        self.nextTextLabel.transform = CGAffineTransformMakeTranslation(0, translantionY);
        self.nextTextLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.text = nextText;
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1.0;
        [self.nextTextLabel removeFromSuperview];
    }];
}

// 在父控件上添加一个lable实现动画
- (void)addNextTextLabelWithText:(NSString *)text atPosition:(CWCalendarLabelPosition)position {
    // 首先清除之前的
    [self.nextTextLabel removeFromSuperview];
    
    CGFloat y = (position == CWCalendarLabelPositionTop) ? self.frame.origin.y - kHeight : self.frame.origin.y + kHeight;
    UILabel *nextTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x, y, kWidth, kHeight)];
    nextTextLabel.text = text;
    nextTextLabel.alpha = 0;
    [self setUpNextTextLabel:nextTextLabel];
    [self.superview addSubview:nextTextLabel];
    self.nextTextLabel = nextTextLabel;
}

// 设置临时文本控件的样式
- (void)setUpNextTextLabel:(UILabel *)label {
    label.textColor = self.textColor;
    label.font = self.font;
    label.textAlignment = self.textAlignment;
    label.numberOfLines = self.numberOfLines;
}

@end
