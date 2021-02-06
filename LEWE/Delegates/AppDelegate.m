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
        
        #pragma mark - default appearance settings
        
        [[UINavigationBar appearance] setTintColor:[UIColor colorNamed:@"barLabelColor"]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorNamed:@"barColor"]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorNamed:@"barLabelColor"]}];
        [[UINavigationBar appearance] setTranslucent:NO];
        [[UIButton appearance] setTitleColor:[UIColor colorNamed:@"buttonLabelColor"] forState:UIControlStateNormal];
//        [[UILabel appearance] setTextColor:[UIColor colorNamed:@"buttonLabelColor"]];
        
    } else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [[LaunchViewController alloc] init];
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}




@end
