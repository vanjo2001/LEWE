//
//  WordPresenter.h
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "WordProtocols.h"


NS_ASSUME_NONNULL_BEGIN

@interface WordPresenter : NSObject <WordPresenterProtocol>

#pragma mark: - protocol required implementation
@property (nonatomic, weak)     id<WordControllerProtocol>  view;
@property (nonatomic, strong)   id<WordInteractorProtocol>  interactor;
@property (nonatomic, strong)   id<MainRouterProtocol>      router;

@end

NS_ASSUME_NONNULL_END
