//
//  AddWordView.h
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "CustomTextField.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WordViewProtocol <NSObject>
- (void)textDidChange:(NSString *)text withFieldType:(AddWordFieldType)type;

#pragma mark - Routing

- (void)back;
@end

@interface AddWordView : UIView <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet CustomTextField *nameTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *nameCollectionView;
@property (weak, nonatomic) IBOutlet CustomTextField *transcriptionTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *transcriptionCollectionView;
@property (weak, nonatomic) IBOutlet CustomTextField *translationTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *translationCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) id<WordViewProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
