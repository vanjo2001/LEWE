//
//  AppDelegate.m
//  LEWE
//
//  Created by IvanLyuhtikov on 12.12.20.
//

#import "AppDelegate.h"
#import "Configurator.h"
#import "LaunchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13, *)) {
        
    } else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [[LaunchViewController alloc] init];
        [self.window makeKeyAndVisible];
    }
    
    
    return YES;
}




@end
