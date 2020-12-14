//
//  Configurator.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import <Foundation/Foundation.h>

@class MainViewController;

@protocol MainConfiguratorProtocol <NSObject>

+ (MainViewController *)setupMainViewController;

@end

NS_ASSUME_NONNULL_BEGIN

@interface Configurator: NSObject <MainConfiguratorProtocol>

@end

NS_ASSUME_NONNULL_END
