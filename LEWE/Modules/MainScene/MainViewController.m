//
//  MainViewController.m
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#import "MainViewController.h"
#import "Utils.h"

#pragma mark - Constants files
#import "ColorConstants.h"
#import "ScreenSizeConstants.h"
#import "FontNamesConstants.h"

#pragma mark - Categories files
#import "UIView+Gradient.h"
#import "UIFont+GetSpecialFont.h"
#import "UIView+Simplification.h"

#pragma mark - Libs
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController ()

@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) NSMutableArray<UIView *> *menuButtons;

@end

@implementation MainViewController


- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] initWithArrangedSubviews:self.menuButtons];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.spacing = 15;
        _stackView.alignment = UIStackViewAlignmentCenter;
    }
    return _stackView;
}

///Make for view another file and load it here
//- (void)loadView {
//    [super loadView];
//}

- (NSMutableArray<UIView *> *)menuButtons {
    if (!_menuButtons) {
        _menuButtons = [[NSMutableArray alloc] init];
        for (NSString *one in arrOfString()) {
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:one forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont getFontWithName:ButtonNewWordFontName andSize:40];
            
            CGSize size = CGSizeMake(button.titleLabel.intrinsicContentSize.width + 20, button.titleLabel.intrinsicContentSize.height + 10);
            button.frame = CGRectMake(0, 0, size.width, size.height);
            
            UIView *gradientView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            size.width,
                                                                            size.height)];

            [gradientView makeRadiousGradientWith:LIGHT_SOFT_BACKGROUND_GRADIENT colorRadiousSizeType:ColorRadiousSizeComputingMiddle];

            UIView *containter = [UIView setViewUnderneath:@[gradientView, button]];
            
            [NSLayoutConstraint activateConstraints:@[
                [containter.widthAnchor constraintEqualToConstant:size.width],
                [containter.heightAnchor constraintEqualToConstant:size.height],
            ]];
            
            containter.transform = CGAffineTransformMakeScale(1.4, 1.4);
            containter.alpha = 0;
            
            containter.layer.cornerRadius = 15;
            containter.clipsToBounds = YES;
            
            [_menuButtons addObject:containter];
        }
        
        ///Animation Block
        
        [UIView animateAsync:_menuButtons withSpeed:0.35 andDuration:5 animationBlock:^(UIView * _Nonnull view) {
            view.alpha = 1.0;
            view.transform = CGAffineTransformIdentity;
        }];
    }
    
    return _menuButtons;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        _addButton.titleLabel.numberOfLines = 0;
        _addButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_addButton setTitle:@"add word" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        _addButton.titleLabel.font = [UIFont getFontWithName:ButtonNewWordFontName andSize:24];
        [_addButton addTarget:self action:@selector(addButtonTupped:) forControlEvents:UIControlEventTouchUpInside];
        return _addButton;
    }
    return _addButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorNamed:@"backgroundColor"];
    
    
#ifdef RELEASE
    self.title = @"WELCOME AppStore";
#elif RELEASE2
    self.title = @"WELCOME LEWE2";
#else
    self.title = @"WELCOME Debug/Debug memory";
#endif
    [self checkTraitCollection];
    
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.stackView];

}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupAddButtonLayout];
    [self setupStackViewLayout];
}


- (void)viewWillAppear:(BOOL)animated {
#warning BAD_DEASAPPEAR_NAVIGATION_CONTROLLER (REDRAWING UI WITH ANOTHER CONSTRAINTS)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.navigationController setNavigationBarHidden:YES];
//    });
}



- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self checkTraitCollection];
}

- (void)checkTraitCollection {
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        [self.view makeRadiousGradientWith: DARK_BACKGROUND_GRADIENT colorRadiousSizeType:ColorRadiousSizeComputingWidth];
        
        ///Update to dark color menu buttons
        
        if (self.menuButtons) {
            for (UIView *view in self.menuButtons) {
                [view makeRadiousGradientWith:DARK_SOFT_BACKGROUND_GRADIENT colorRadiousSizeType:ColorRadiousSizeComputingMiddle];
            }
        }

    } else {
        [self.view makeRadiousGradientWith: LIGHT_BACKGROUND_GRADIENT colorRadiousSizeType:ColorRadiousSizeComputingWidth];
        
        ///Update to light color menu buttons
        
        if (self.menuButtons) {
            for (UIView *view in self.menuButtons) {
                [view makeRadiousGradientWith:LIGHT_SOFT_BACKGROUND_GRADIENT colorRadiousSizeType:ColorRadiousSizeComputingMiddle];
            }
        }
        
    }
}


- (void)setupAddButtonLayout {
    self.addButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.addButton.rightAnchor constraintEqualToAnchor:guide.rightAnchor constant:0],
        [self.addButton.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-SCREEN_HEIGHT*1.f/8],
        [self.addButton.widthAnchor constraintEqualToAnchor:guide.widthAnchor multiplier:1.f/5],
        [self.addButton.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:1.f/8],
    ]];
}

- (void)setupStackViewLayout {
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.topAnchor constraintEqualToAnchor:guide.topAnchor constant:SCREEN_HEIGHT/9],
        [self.stackView.centerXAnchor constraintEqualToAnchor:guide.centerXAnchor],
    ]];
    

}

#pragma mark - Actions

- (void)addButtonTupped:(UIButton *)sender {
//    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), ^{
        AudioServicesPlayAlertSound(1519);
//    });
//    [self.presenter showWorldViewController];
    [self.presenter presentWorldViewControllerFromSource:self];
}

#pragma mark - Constants

static NSArray<NSString *> * arrOfString() {
    return @[@"words' list", @"repeat words", @"another", @"learn by Music"];
}

@end
