//
//  UIView+Gradient.h
//  LEWE
//
//  Created by IvanLyuhtikov on 14.12.20.
//

#import <UIKit/UIKit.h>
#import "GradientRadiousLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)

- (void)makeRadiousGradientWith:(NSArray *)colors colorRadiousSizeType:(ColorRadiousSizeComputingType)colorRadiousSize;
- (void)makeLinearGradient:(NSArray *)colors;

@end

NS_ASSUME_NONNULL_END
