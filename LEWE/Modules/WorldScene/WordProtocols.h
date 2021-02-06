//
//  WordProtocols.h
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "Router.h"
#import "AddWordView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WordPresenterProtocol;
@protocol WordViewProtocol;

@protocol WordControllerProtocol <NSObject>
@property (nonatomic, strong) id<WordPresenterProtocol> presenter;
@end


@protocol WordInteractorProtocol <NSObject>
@property (nonatomic, weak) id<WordPresenterProtocol> presenter;

@optional
- (void)getDataByWordName:(NSString *)name withFieldType:(AddWordFieldType)type;
@end


@protocol WordInteractorProtocol;
@protocol WordControllerProtocol;

@protocol WordPresenterProtocol <NSObject>
@required
@property (nonatomic, weak)     id<WordControllerProtocol>  view;
@property (nonatomic, strong)   id<WordInteractorProtocol>  interactor;
@property (nonatomic, strong)   id<MainRouterProtocol>      router;

@optional
- (void)updateWordName:(NSString *)name withTextFieldType:(AddWordFieldType)type;

#pragma mark - Routing
- (void)backToRoot;

@end

NS_ASSUME_NONNULL_END
