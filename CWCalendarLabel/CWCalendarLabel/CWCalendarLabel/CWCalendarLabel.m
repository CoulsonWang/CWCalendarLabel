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
    CWCalendarLabelPositionCenter,
    CWCalendarLabelPositionTop,
    CWCalendarLabelPositionBottom,
} CWCalendarLabelPosition;

@interface CWCalendarLabel ()


// 记录是否正在播放动画
@property (assign, nonatomic, getter=isAnimating) BOOL animating;

@property (assign, nonatomic) NSInteger animCount;


@end

@implementation CWCalendarLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.animateDuration = 0.5;
        self.animCount = 0;
    }
    return self;
}

- (BOOL)isAnimating {
    return (self.animCount != 0);
}


// 核心方法
- (void)showNextText:(NSString *)nextText withDirection:(CWCalendarLabelScrollDirection)direction {
    
    CWCalendarLabelPosition nextPosition = (direction == CWCalendarLabelPositionTop) ? CWCalendarLabelPositionBottom : CWCalendarLabelPositionTop;
    UILabel *nextLabel = [self addNextTextLabelWithText:nextText atPosition:nextPosition];
    UILabel *currentLabel = [self addNextTextLabelWithText:self.text atPosition:CWCalendarLabelPositionCenter];
    CGFloat translantionY = (nextPosition == CWCalendarLabelPositionTop) ? kHeight : -kHeight;
    
    self.animCount += 1;
    [UIView animateWithDuration:self.animateDuration animations:^{
        currentLabel.transform = CGAffineTransformMakeTranslation(0, translantionY);
        currentLabel.alpha = 0;
        self.hidden = YES;
        nextLabel.transform = CGAffineTransformMakeTranslation(0, translantionY);
        nextLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.animCount -= 1;
        self.text = nextText;
        [nextLabel removeFromSuperview];
        [currentLabel removeFromSuperview];
        if (!self.animating) {
            self.hidden = NO;
        }
    }];
}

#pragma mark - 私有工具方法
// 在父控件上添加一个lable实现动画
- (UILabel *)addNextTextLabelWithText:(NSString *)text atPosition:(CWCalendarLabelPosition)position {
    CGFloat y;
    switch (position) {
        case CWCalendarLabelPositionTop:
            y = self.frame.origin.y - kHeight;
            break;
        case CWCalendarLabelPositionBottom:
            y = self.frame.origin.y + kHeight;
            break;
        case CWCalendarLabelPositionCenter:
            y = self.frame.origin.y;
            break;
        default:
            break;
    }
    UILabel *animLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x, y, kWidth, kHeight)];
    animLabel.text = text;
    animLabel.alpha = (position == CWCalendarLabelPositionCenter) ? 1 : 0;
    [self setUpNextTextLabel:animLabel];
    [self.superview addSubview:animLabel];
    
    return animLabel;
}

// 设置临时文本控件的样式
- (void)setUpNextTextLabel:(UILabel *)label {
    label.textColor = self.textColor;
    label.font = self.font;
    label.textAlignment = self.textAlignment;
    label.numberOfLines = self.numberOfLines;
}


@end
