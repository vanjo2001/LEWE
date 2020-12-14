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
#import "MainRouter.h"

@implementation Configurator

+ (MainViewController *)setupMainViewController {
    
    id<MainViewProtocol> vc = [[MainViewController alloc] init];
    id<MainPresenterProtocol> presenter = [[MainPresenter alloc] init];
    id<MainInteractorProtocol> interactor = [[MainInteractor alloc] init];
    id<MainRouterProtocol> router = [[MainRouter alloc] init];
    
    vc.presenter = presenter;
    
    presenter.view = vc;
    presenter.interactor = interactor;
    presenter.router = router;
    
    interactor.presenter = presenter;
    
    return (MainViewController *)vc;
}

@end
