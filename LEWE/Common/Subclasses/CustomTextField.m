//
//  CustomTextField.m
//  LEWE
//
//  Created by IvanLyuhtikov on 3.01.21.
//

#import "CustomTextField.h"

@interface CustomTextField ()
@property (strong, nonatomic) CALayer *bottomLayer;
@property (strong, nonatomic) UILabel *placeholderLabel;
@end

@implementation CustomTextField {
    UIColor *_activeColor;
    UIColor *_nonActiveColor;
}

- (CALayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CALayer layer];
    }
    return _bottomLayer;
}

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                   -15,
                                                                   self.bounds.size.width,
                                                                   15)];
        label.font = [self.font fontWithSize:self.font.pointSize-2];
        
        label.textColor = [UIColor greenColor];
        label.text = self.placeholder;
        label.alpha = 0.0;
        _placeholderLabel = label;
    }
    return _placeholderLabel;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _activeColor = UIColor.greenColor;
        _nonActiveColor = UIColor.redColor;
        [self createStyle];
        [self addTarget:self action:@selector(didBegin) forControlEvents:UIControlEventEditingDidBegin];
        [self addTarget:self action:@selector(didEnd) forControlEvents:UIControlEventEditingDidEnd];
        [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)createStyle {
    self.borderStyle = UITextBorderStyleNone;
    self.font = [self.font fontWithSize:16];
    self.bottomLayer.frame = CGRectMake(0,
                                   self.bounds.size.height-2,
                                   self.bounds.size.width,
                                   2);
    self.bottomLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.layer addSublayer:self.bottomLayer];
        
}

- (void)didBegin {
    self.bottomLayer.backgroundColor = _activeColor.CGColor;
}

- (void)didEnd {
    self.bottomLayer.backgroundColor = _nonActiveColor.CGColor;
}

- (void)valueChanged {
    if (![self.text isEqualToString:@""]) {
        [self addSubview:self.placeholderLabel];
        [UIView animateWithDuration:0.4 animations:^{
            self.placeholderLabel.alpha = 1.0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.placeholderLabel.alpha = 0.0;
        }];
    }
}

@end
