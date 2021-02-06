//
//  GradientRadiousLayer.m
//  LEWE
//
//  Created by IvanLyuhtikov on 14.12.20.
//

#import "GradientRadiousLayer.h"
#import "UIView+Gradient.h"
#import "Utils.h"

@class UIColor;


@interface GradientRadiousLayer () {
    ColorRadiousSizeComputingType _colorRadiousSizeType;
}

@property (nullable, copy) NSArray *colors;

@end

@implementation GradientRadiousLayer

- (instancetype)initWithColors:(NSArray *)colors withColorRadiousSizeType:(ColorRadiousSizeComputingType)colorRadiousSizeType {
    self = [super init];
    if (self) {
        _colors = colors;
        _colorRadiousSizeType = colorRadiousSizeType;
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    
    ///Maybe I'll refactor this sometime:)
    CGFloat colors[self.colors.count];
    int i = 0;
    for (i = 0; i < self.colors.count; i++) {
        colors[i] = [[self.colors objectAtIndex:i] floatValue];
    }
    
    size_t gradLocationsNum = 2;
    CGFloat gradLocations[2] = { 0.0f, 1.0f };
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, gradLocations, gradLocationsNum);
    CGColorSpaceRelease(colorSpace);

    CGPoint gradCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat gradRadius;
    
    switch (_colorRadiousSizeType) {
        case ColorRadiousSizeComputingWidth:
            gradRadius = self.bounds.size.width;
            break;
        case ColorRadiousSizeComputingHeight:
            gradRadius = self.bounds.size.height;
        case ColorRadiousSizeComputingMiddle:
            gradRadius = (self.bounds.size.width + self.bounds.size.height) / 2;
        default:
            break;
    }

    CGContextDrawRadialGradient(ctx, gradient, gradCenter, 0, gradCenter, gradRadius, kCGGradientDrawsAfterEndLocation);


    CGGradientRelease(gradient);
}



@end
