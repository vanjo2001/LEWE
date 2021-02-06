//
//  UIView+Simplification.h
//  LEWE
//
//  Created by IvanLyuhtikov on 15.12.20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Simplification)

#pragma mark: - type value operations
- (CGSize)getSize;
- (CGPoint)getOrigin;
- (CGFloat)getWidth;
- (CGFloat)getHeight;

#pragma mark: - reference value operations
+ (nullable UIView *)setViewUnderneath:(NSArray<UIView *> *)view;
+ (void)animateAsync:(NSMutableArray<UIView *> *)views withSpeed:(CGFloat)speed andDuration:(CGFloat)duration animationBlock:(void (^ __nullable)(UIView *view))block;
@end

NS_ASSUME_NONNULL_END
