//
//  GradientRadiousLayer.h
//  LEWE
//
//  Created by IvanLyuhtikov on 14.12.20.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ColorRadiousSizeComputingType) {
    ColorRadiousSizeComputingWidth = 0,
    ColorRadiousSizeComputingHeight,
    ColorRadiousSizeComputingMiddle
};


@interface GradientRadiousLayer : CALayer

- (instancetype)initWithColors:(NSArray *)colors withColorRadiousSizeType:(ColorRadiousSizeComputingType)colorRadiousSizeType;

@end

NS_ASSUME_NONNULL_END
