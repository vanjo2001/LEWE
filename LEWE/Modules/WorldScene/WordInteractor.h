//
//  WordInteractor.h
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "WordProtocols.h"


NS_ASSUME_NONNULL_BEGIN

@interface WordInteractor : NSObject <WordInteractorProtocol>

#pragma mark: - protocol implementation
@property (nonatomic, weak) id<WordPresenterProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
