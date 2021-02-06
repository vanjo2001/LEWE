//
//  WordFullInfo.h
//  LEWE
//
//  Created by IvanLyuhtikov on 8.01.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface WordFullInfo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *translations;

@end

NS_ASSUME_NONNULL_END
