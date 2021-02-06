//
//  WordViewController.m
//  LEWE
//
//  Created by IvanLyuhtikov on 19.12.20.
//

#import "WordViewController.h"
#import "AddWordView.h"
#import "WordPresenter.h"

#pragma mark - Constants files
#import "ColorConstants.h"

#pragma mark - Categories files
#import "UIView+Gradient.h"

@interface WordViewController ()
@property (strong, nonatomic) AddWordView *addWordView;
@end

@implementation WordViewController

- (AddWordView *)addWordView {
    if (!_addWordView) {
        _addWordView = (AddWordView *)([NSBundle.mainBundle loadNibNamed:@"AddWordView" owner:nil options:nil].firstObject);
    }
    return _addWordView;
}

- (void)loadView {
    self.view = self.addWordView;
    
#pragma mark - subscription on delegate
    self.addWordView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.addWordView.nameTextField becomeFirstResponder];
    
    self.title = @"ADD WORD";
}


- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - world view delegate
- (void)back {
    [self.presenter backToRoot];
}

- (void)textDidChange:(NSString *)text withFieldType:(AddWordFieldType)type {
    [self.presenter updateWordName:text withTextFieldType:type];
}

@end
