//
//  UIView+Simplification.m
//  LEWE
//
//  Created by IvanLyuhtikov on 15.12.20.
//

#import "UIView+Simplification.h"

@implementation UIView (Simplification)

- (CGSize)getSize {
    return self.bounds.size;
}

- (CGPoint)getOrigin {
    return self.bounds.origin;
}

- (CGFloat)getWidth {
    return [self getSize].width;
}

- (CGFloat)getHeight {
    return [self getSize].height;
}


+ (nullable UIView *)setViewUnderneath:(NSArray<UIView *> *)views {
    if (!views.firstObject) {
        return nil;
    }
    
    UIView *containerView = [[UIView alloc] initWithFrame:views.firstObject.frame];
    
    for (UIView *view in views) {
        [containerView addSubview:view];
    }
    
    return containerView;
}

+ (void)animateAsync:(NSMutableArray<UIView *> *)views withSpeed:(CGFloat)speed andDuration:(CGFloat)duration animationBlock:(void (^ __nullable)(UIView *view))block {
    NSInteger index = 0;
    for (UIView *view in views) {
        index++;
        [UIView animateWithDuration:speed delay:index/duration options:UIViewAnimationOptionCurveEaseOut animations:^{
            block(view);
        } completion:nil];
    }
}

@end
