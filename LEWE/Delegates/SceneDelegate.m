//
//  SceneDelegate.m
//  LEWE
//
//  Created by IvanLyuhtikov on 12.12.20.
//

#import "SceneDelegate.h"
#import "Configurator.h"
#import "LaunchViewController.h"

@interface SceneDelegate ()

@end

API_AVAILABLE(ios(13.0))
@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene;
    
    if ((windowScene = (UIWindowScene *)scene)) {
        UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
        window.rootViewController = [[LaunchViewController alloc] init];
        self.window = window;
        [window makeKeyAndVisible];
    }
}


@end
