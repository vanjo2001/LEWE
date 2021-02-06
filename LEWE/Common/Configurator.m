//
//  Configurator.m
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "Configurator.h"
#import "MainProtocols.h"
#import "MainViewController.h"
#import "MainPresenter.h"
#import "MainInteractor.h"

#import "WordPresenter.h"
#import "WordInteractor.h"

#import "WordViewController.h"

@implementation Configurator

- (nonnull MainViewController *)setupMainViewControllerWith:(nonnull id<MainRouterProtocol>)router {
    id<MainViewProtocol> vc = [[MainViewController alloc] init];
    id<MainPresenterProtocol> presenter = [[MainPresenter alloc] init];
    id<MainInteractorProtocol> interactor = [[MainInteractor alloc] init];
    
    vc.presenter = presenter;
    
    presenter.view = vc;
    presenter.interactor = interactor;
    presenter.router = router;
    
    interactor.presenter = presenter;
    
    return (MainViewController *)vc;
}

- (nonnull WordViewController *)setupWordViewControllerWith:(nonnull id<MainRouterProtocol>)router {
    id<WordControllerProtocol> vc = [[WordViewController alloc] init];
    id<WordPresenterProtocol> presenter = [[WordPresenter alloc] init];
    id<WordInteractorProtocol> interactor = [[WordInteractor alloc] init];
    
    vc.presenter = presenter;
    
    presenter.view = vc;
    presenter.interactor = interactor;
    presenter.router = router;
    
    interactor.presenter = presenter;
    
    return (WordViewController *)vc;
}

@end
