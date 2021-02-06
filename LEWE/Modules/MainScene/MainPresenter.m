//
//  MainPresenter.m
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "MainPresenter.h"

@implementation MainPresenter

- (void)showWorldViewController {
    [self.router showWordViewController];
}

- (void)presentWorldViewControllerFromSource:(UIViewController *)vc {
    [self.router presentAddWordViewControllerFrom:vc];
}

@end
