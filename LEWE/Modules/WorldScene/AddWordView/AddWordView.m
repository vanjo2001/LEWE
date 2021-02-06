//
//  AddWordView.m
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "AddWordView.h"

#pragma mark - Constants files
#import "ColorConstants.h"

#pragma mark - Categories files
#import "UIView+Gradient.h"

#pragma mark - Libs
#import <AudioToolbox/AudioToolbox.h>

@interface AddWordView ()
@end

@implementation AddWordView {
    NSArray<UITextField *> *_arrOfTextFields;
    NSArray<UICollectionView *> *_arrOfCollectionViews;
    NSArray<NSNumber *> *_arrOfFieldTypes;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _arrOfFieldTypes = @[[NSNumber numberWithInteger:AddWordFieldTypeName],
                         [NSNumber numberWithInteger:AddWordFieldTypeTranscription],
                         [NSNumber numberWithInteger:AddWordFieldTypeTranslation]];
    
    _arrOfTextFields = @[self.nameTextField,
                        self.transcriptionTextField,
                        self.translationTextField];
    
    _arrOfCollectionViews = @[self.nameCollectionView,
                     self.translationCollectionView,
                     self.transcriptionCollectionView];
    
    NSInteger index = 0;
    for (CustomTextField *textField in _arrOfTextFields) {
        textField.delegate = self;
        textField.fieldType = [_arrOfFieldTypes[index] integerValue];
        index++;
    }
    
    for (UICollectionView *collection in _arrOfCollectionViews) {
        collection.layer.cornerRadius = 10;
        collection.backgroundColor = [collection.backgroundColor colorWithAlphaComponent:0.1];
    }
}

- (IBAction)resignAll:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self];
    if (point.y > self.addButton.frame.origin.y) {
        NSArray *arr = @[self.nameTextField,
                         self.transcriptionTextField,
                         self.translationTextField];
        for (UITextField *field in arr) {
            [field resignFirstResponder];
        }
    }

}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self checkTraitCollection];
}

- (void)checkTraitCollection {
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        
        ///Update backround to dark color
        
        [self makeLinearGradient:LINEAR_DARK_BACKGROUND_GRADIENT];
        

    } else {
        
        ///Update backround to light color
        
        [self makeLinearGradient:LINEAR_LIGHT_BACKGROUND_GRADIENT];
    }
}

#pragma mark: - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    dispatch_async(dispatch_get_main_queue(), ^{
        AudioServicesPlayAlertSound(1519);
//    });
    NSUInteger index = [_arrOfTextFields indexOfObject:textField];
    if (index >= _arrOfTextFields.count - 1) {
        [textField resignFirstResponder];
        [_arrOfTextFields[0] becomeFirstResponder];
        return YES;
    }
    [textField resignFirstResponder];
    [_arrOfTextFields[index + 1] becomeFirstResponder];
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    CustomTextField *custom = (CustomTextField *)textField;
    [self.delegate textDidChange:custom.text withFieldType:custom.fieldType];
}

#pragma mark: - vc delegate

- (IBAction)addWord:(id)sender {
    [self.delegate back];
#warning FIX IT LATER
}



@end
