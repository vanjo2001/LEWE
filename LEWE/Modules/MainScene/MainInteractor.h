//
//  MainInteractor.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "MainProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainInteractor : NSObject <MainInteractorProtocol>

#pragma mark: - protocol implementation
@property (nonatomic, weak) id<MainPresenterProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
