//
//  LaunchViewController.m
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "LaunchViewController.h"
#import "ImageNames.h"
#import "SizeConstants.h"
#import "Configurator.h"
#import "MainViewController.h"
#import <AudioToolbox/AudioToolbox.h> 

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIImageView *circle;
@property (nonatomic, strong) UIImageView *greeting;

@end

@implementation LaunchViewController

- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [self imageViewByName:LaunchBackgroundImageName];
        return _backgroundView;
    }
    return _backgroundView;
}

- (UIImageView *)circle {
    if (!_circle) {
        _circle = [self imageViewByName:LaunchCircleImageName];
        return _circle;
    }
    return _circle;
}

- (UIImageView *)greeting {
    if (!_greeting) {
        _greeting = [self imageViewByName:LaunchGreetingImageName];
        return _greeting;
    }
    return _greeting;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupViews];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)setupViews {
    self.view = self.backgroundView;
    
    [self.view addSubview:self.circle];
    [self.view addSubview:self.greeting];
    
    self.circle.frame = CGRectMake(SCREEN_WIDTH_MID - self.circle.frame.size.width/2,
                                   SCREEN_HEIGHT_MID - self.circle.frame.size.height/2,
                                   self.circle.frame.size.width,
                                   self.circle.frame.size.height);
    
    self.greeting.frame = CGRectMake(SCREEN_WIDTH_MID - self.greeting.frame.size.width/2,
                                     SCREEN_HEIGHT_MID - self.greeting.frame.size.height/2,
                                     self.greeting.frame.size.width,
                                     self.greeting.frame.size.height);
    
    
    [UIView animateWithDuration:0.3 delay:0.7 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.circle.transform = CGAffineTransformMakeScale(7, 7);
        self.greeting.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            printf("hi");
            AudioServicesPlayAlertSound(1519);
            MainViewController *vc = Configurator.setupMainViewController;
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];
}

- (UIImageView *)imageViewByName: (NSString *)name {
    UIImage *img = [UIImage imageNamed:name];
    return [[UIImageView alloc] initWithImage:img];
}

@end
