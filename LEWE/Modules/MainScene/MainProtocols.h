//
//  MainProtocols.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "Router.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MainPresenterProtocol;
@class UINavigationController;
@class MainViewController;
@class WordViewController;
@protocol ConfiguratorProtocol;


@protocol MainViewProtocol <NSObject>
@required
@property (nonatomic, strong) id<MainPresenterProtocol> presenter;
@end


@protocol MainInteractorProtocol <NSObject>
@required
@property (nonatomic, weak) id<MainPresenterProtocol> presenter;
@end


@protocol MainPresenterProtocol <NSObject>
@required
@property (nonatomic, weak)     id<MainViewProtocol>        view;
@property (nonatomic, strong)   id<MainInteractorProtocol>  interactor;
@property (nonatomic, strong)   id<MainRouterProtocol>      router;

@optional
- (void)presentWorldViewControllerFromSource:(UIViewController *)vc;
- (void)showWorldViewController;
- (void)backToRoot;
@end



NS_ASSUME_NONNULL_END
