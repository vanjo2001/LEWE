//
//  Configurator.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import <Foundation/Foundation.h>
#import "MainProtocols.h"

NS_ASSUME_NONNULL_BEGIN


@protocol ConfiguratorProtocol <NSObject>

- (MainViewController *)setupMainViewControllerWith: (id<MainRouterProtocol>)router;
- (WordViewController *)setupWordViewControllerWith: (id<MainRouterProtocol>)router;

@end

@interface Configurator: NSObject <ConfiguratorProtocol>

@end

NS_ASSUME_NONNULL_END
