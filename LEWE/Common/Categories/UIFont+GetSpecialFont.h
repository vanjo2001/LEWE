//
//  UIFont+GetSpecialFont.h
//  LEWE
//
//  Created by IvanLyuhtikov on 15.12.20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (GetSpecialFont)

+ (instancetype)getFontWithName:(NSString *)searchedName andSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
