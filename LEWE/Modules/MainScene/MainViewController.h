//
//  MainViewController.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import <UIKit/UIKit.h>
#import "MainProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <MainViewProtocol>

#pragma mark: - protocol implementation
@property (nonatomic, strong) id<MainPresenterProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
