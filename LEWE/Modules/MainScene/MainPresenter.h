//
//  MainPresenter.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import <Foundation/Foundation.h>
#import "MainProtocols.h"
#import "Router.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainPresenter : NSObject <MainPresenterProtocol>

#pragma mark: - protocol required implementation
@property (nonatomic, weak)     id<MainViewProtocol>        view;
@property (nonatomic, strong)   id<MainInteractorProtocol>  interactor;
@property (nonatomic, strong)   id<MainRouterProtocol>      router;

@end

NS_ASSUME_NONNULL_END
