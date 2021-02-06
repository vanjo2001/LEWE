//
//  CustomTextField.h
//  LEWE
//
//  Created by IvanLyuhtikov on 3.01.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AddWordFieldType) {
    AddWordFieldTypeName = 0,
    AddWordFieldTypeTranscription,
    AddWordFieldTypeTranslation
};

@interface CustomTextField : UITextField
@property (nonatomic, assign) AddWordFieldType fieldType;
@end

NS_ASSUME_NONNULL_END
