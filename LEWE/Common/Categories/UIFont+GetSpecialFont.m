//
//  UIFont+GetSpecialFont.m
//  LEWE
//
//  Created by IvanLyuhtikov on 15.12.20.
//

#import "UIFont+GetSpecialFont.h"

@implementation UIFont (GetSpecialFont)

+ (instancetype)getFontWithName:(NSString *)searchedName andSize:(CGFloat)size {
    return [UIFont fontWithName:searchedName size:size];
}

@end
