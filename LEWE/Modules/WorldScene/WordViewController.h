//
//  WordViewController.h
//  LEWE
//
//  Created by IvanLyuhtikov on 19.12.20.
//

#import <UIKit/UIKit.h>
#import "WordProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface WordViewController : UIViewController <WordControllerProtocol, WordViewProtocol>

#pragma mark: - protocol required implementation
@property (nonatomic, strong) id<WordPresenterProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
