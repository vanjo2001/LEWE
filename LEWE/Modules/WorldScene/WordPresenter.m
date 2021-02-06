//
//  WordPresenter.m
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "WordPresenter.h"

@implementation WordPresenter

- (void)updateWordName:(NSString *)name withTextFieldType:(AddWordFieldType)type {
    [self.interactor getDataByWordName:name withFieldType:type];
}

- (void)backToRoot {
    [self.router popToRoot];
}

@end
