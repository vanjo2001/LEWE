//
//  MainProtocols.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@protocol MainPresenterProtocol;


@protocol MainViewProtocol <NSObject>

@property (nonatomic, strong) id<MainPresenterProtocol> presenter;

@end


@protocol MainInteractorProtocol <NSObject>

@property (nonatomic, weak) id<MainPresenterProtocol> presenter;

@end


@protocol MainRouterProtocol <NSObject>
@end


@protocol MainPresenterProtocol <NSObject>

@property (nonatomic, weak) id<MainViewProtocol> view;
@property (nonatomic, strong) id<MainInteractorProtocol> interactor;
@property (nonatomic, strong) id<MainRouterProtocol> router;

@end



NS_ASSUME_NONNULL_END
