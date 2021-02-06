//
//  Constants.h
//  LEWE
//
//  Created by IvanLyuhtikov on 13.12.20.
//

#ifndef Constants_h
#define Constants_h

#define color(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#pragma mark: - system colors

#define lightSystemBlueColor color(0, 122, 255)
#define darkSystemBlueColor color(10, 132, 255)

#define lightSystemGreenColor color(52, 199, 89)
#define darkSystemGreenColor color(48, 209, 88)

#define lightSystemTealColor color(90, 200, 250)
#define darkSystemTealColor color(100, 210, 255)


#pragma mark: - gradient colors
static CGFloat const SPECIAL_COEF = 1.0f;

#pragma mark: - MAIN SCREENS VERSION

#define LIGHT_BACKGROUND_GRADIENT   @[@(255.f/255/SPECIAL_COEF), @(255.f/255/SPECIAL_COEF), @(255.f/255/SPECIAL_COEF), @1, \
                                            @(158.f/255/SPECIAL_COEF), @(101.f/255/SPECIAL_COEF), @(218.f/255/SPECIAL_COEF), @1]
                                            
#define DARK_BACKGROUND_GRADIENT    @[@(16.f/255/SPECIAL_COEF), @(16.f/255/SPECIAL_COEF), @(16.f/255/SPECIAL_COEF), @1, \
                                            @(125.f/255/SPECIAL_COEF), @(0.f/255/SPECIAL_COEF), @(255.f/255/SPECIAL_COEF), @1]


#pragma mark: - SECONDARY SCREENS VERSION


#define LINEAR_LIGHT_BACKGROUND_GRADIENT   @[ \
                                            (id)[color((158.f/SPECIAL_COEF), (101.f/SPECIAL_COEF), (218.f/SPECIAL_COEF)) CGColor], \
                                            (id)[color((255.f/SPECIAL_COEF), (255.f/SPECIAL_COEF), (255.f/SPECIAL_COEF)) CGColor], \
                                            ]

#define LINEAR_DARK_BACKGROUND_GRADIENT   @[ \
                                            (id)[color((125/SPECIAL_COEF), (0/SPECIAL_COEF), (255/SPECIAL_COEF)) CGColor], \
                                            (id)[color((16/SPECIAL_COEF), (16.f/SPECIAL_COEF), (16/SPECIAL_COEF)) CGColor], \
                                            ]


#pragma mark: - SOFT VERSION

#define LIGHT_SOFT_BACKGROUND_GRADIENT  @[@(0.7/SPECIAL_COEF), @(0.7/SPECIAL_COEF), @(0.7/SPECIAL_COEF), @1, \
                                            @(158.f/255/SPECIAL_COEF), @(101.f/255/SPECIAL_COEF), @(218.f/255/SPECIAL_COEF), @1]

#define DARK_SOFT_BACKGROUND_GRADIENT   @[@(50.f/255/SPECIAL_COEF), @(50.f/255/SPECIAL_COEF), @(50.f/255/SPECIAL_COEF), @1, \
                                            @(125.f/255/SPECIAL_COEF), @(0.f/255/SPECIAL_COEF), @(255.f/255/SPECIAL_COEF), @1]


#pragma mark: - NAVIGATION BAR COLORS

#define LIGHT_NAVIGATIONBAR_COLOR color(158, 101, 218)
#define DARK_NAVIGATIONBAR_COLOR color(125, 0, 255)

#endif /* Constants_h */
