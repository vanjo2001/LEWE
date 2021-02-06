//
//  UIView+Gradient.m
//  LEWE
//
//  Created by IvanLyuhtikov on 14.12.20.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)makeRadiousGradientWith: (NSArray *)colors colorRadiousSizeType:(ColorRadiousSizeComputingType)colorRadiousSize {
    GradientRadiousLayer *gradientLayer = [[GradientRadiousLayer alloc] initWithColors:colors withColorRadiousSizeType:colorRadiousSize];
    gradientLayer.frame = self.bounds;
    
    if (self.layer.sublayers.firstObject) {
        [self.layer.sublayers.firstObject removeFromSuperlayer];
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)makeLinearGradient:(NSMutableArray *)colors {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    
    gradientLayer.colors = colors;
    gradientLayer.locations = @[@0.0, @1.0];
    
    
    CALayer *sublayer = self.layer.sublayers.firstObject;
    if (sublayer.frame.size.height == self.frame.size.height && sublayer.frame.size.width == self.frame.size.width) {
        [self.layer.sublayers.firstObject removeFromSuperlayer];
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
