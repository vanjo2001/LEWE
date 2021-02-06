//
//  Router.h
//  LEWE
//
//  Created by IvanLyuhtikov on 19.12.20.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@class UINavigationController;
@class Configurator;
@protocol ConfiguratorProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol RouterProtocol <NSObject>

@property (nullable, nonatomic, strong) UINavigationController *navigationController;
@property (nullable, nonatomic, strong) id<ConfiguratorProtocol> configurator;

@end

@protocol MainRouterProtocol <NSObject>

- (void)initialViewController;
- (void)showWordViewController;
- (void)presentAddWordViewControllerFrom:(UIViewController *)source;
- (void)popToRoot;

@end

@interface Router : NSObject <RouterProtocol, MainRouterProtocol>


- (instancetype)initWithNavigationController:(UINavigationController *)navigationController andWith:(id<ConfiguratorProtocol>)configurator;

#pragma mark: - protocol implementation
@property (nullable, nonatomic, strong) UINavigationController *navigationController;
@property (nullable, nonatomic, strong) id<ConfiguratorProtocol> configurator;

@end

NS_ASSUME_NONNULL_END
