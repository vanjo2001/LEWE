//
//  RouterProtocol.m
//  LEWE
//
//  Created by IvanLyuhtikov on 19.12.20.
//

#import "Router.h"
#import <UIKit/UIKit.h>
#import "Configurator.h"

#import "UIWindow+PazLabs.h"

@implementation Router

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController andWith:(id<ConfiguratorProtocol>)configurator {
    self = [super self];
    if (self) {
        _navigationController = navigationController;
        _configurator = configurator;
    }
    return self;
}

- (void)initialViewController {
    if (self.navigationController) {
        if (self.configurator) {
            MainViewController *mainVc = [self.configurator setupMainViewControllerWith:self];
            self.navigationController.viewControllers = @[mainVc];
        } else {
            return;
        }
    }
}

- (void)showWordViewController {
    if (self.navigationController) {
        if (self.configurator) {
            id wordVC = [self.configurator setupWordViewControllerWith:self];
            [self.navigationController pushViewController:wordVC animated:YES];
        }
    }
}

- (void)popToRoot {
    if (self.navigationController) {
        if (!self.navigationController.topViewController.beingPresented) {
            UIViewController *current = UIApplication.sharedApplication.keyWindow.visibleViewController;
            [current dismissViewControllerAnimated:YES completion:nil];
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)presentAddWordViewControllerFrom:(nonnull UIViewController *)source {
    id wordVC = [self.configurator setupWordViewControllerWith:self];
    [source presentViewController:wordVC animated:YES completion:nil];
}



@end
