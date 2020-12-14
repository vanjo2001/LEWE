//
//  MainViewController.m
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "MainViewController.h"
#import "ColorConstants.h"

@interface MainViewController ()
@end

@implementation MainViewController

@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorNamed:@"backgroundColor"];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    self.view.backgroundColor = [UIColor colorNamed:@"backgroundColor"];
}


@end
