//
//  WordInteractor.m
//  LEWE
//
//  Created by IvanLyuhtikov on 2.01.21.
//

#import "WordInteractor.h"


static const NSString *path = @"https://www.multitran.com/m.exe?l1=1&l2=2&s=";

typedef NS_ENUM(NSInteger, LEWEAttribute) {
    LEWEAttributeName = 0,
    LEWEAttributeTranscription,
    LEWEAttributeTranslation
};

@implementation WordInteractor

#pragma mark - public API

- (void)getDataByWordName:(NSString *)name withFieldType:(AddWordFieldType)type {
    NSMutableArray *pathArr = [NSMutableArray arrayWithObjects:path, nil];
    __block NSArray *parsed = @[];
    
    [pathArr addObject:name];
    NSString *fullPath = [pathArr componentsJoinedByString:@""];
    NSString *correctFullPath = [fullPath stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    __block NSMutableString *htmlString = NULL;
    __weak typeof(self) weakSelf = self;
    [self loadHTMLStringByPath:correctFullPath completionHandler:^(NSMutableString *html) {
        __strong typeof(self) strongSelf = weakSelf;
        htmlString = html;
        parsed = [strongSelf getParsedString:html withAttribute:type];
//        NSLog(@"%@", htmlString);
    }];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        //Run UI Updates
    });
    
//#warning FIX IT URGENTLY
}

#pragma mark - private API

- (void)loadHTMLStringByPath:(NSString *)path completionHandler:(void (^)(NSMutableString *))completion {
//#warning FIX IT URGENTLY
    NSURL *url = [NSURL URLWithString:path];
    __block NSError *error = NULL;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        if (url) {
            NSMutableString *result = [NSMutableString stringWithContentsOfURL:url
                                                encoding:NSUTF8StringEncoding
                                                error: &error];
            completion(result);
        } else {
            completion([@"empty" mutableCopy]);
        }
        
    });
}

typedef NSMutableDictionary<NSMutableString *, NSMutableArray<NSString *> *> * Dictionary;
typedef NSMutableDictionary<NSString *, Dictionary> * MultyDictionary;

- (NSArray *)getParsedString:(NSString *)htmlString withAttribute:(AddWordFieldType)attribute {
    NSLog(@"%@", htmlString);
    MultyDictionary resultDicitonary = [NSMutableDictionary new];
    Dictionary wordsSpecialSubject = [NSMutableDictionary new];
    
    NSString *currentWordKind = @"";
    
    NSMutableString *currentSubjectTd = [NSMutableString new];
    
    NSMutableArray<NSString *> *arrOfTranscriptions = [NSMutableArray new];
    
#pragma unused(wordsSpecialSubject, currentWordKind, currentSubjectTd, arrOfTranscriptions)
    NSString *pattern = @"";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\b(a|b)(c|d)\\b"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    
    
    for(NSMutableString *key in [resultDicitonary allKeys]) {
        NSLog(@"type = %@", key);
        Dictionary values = [resultDicitonary objectForKey:key];
        for (NSMutableString *str in [values allKeys]) {
            NSLog(@"\t\tsubject = %@", str);
            NSMutableArray<NSString *> *arr = [values objectForKey:str];
            for (NSString *oneValue in arr) {
                NSLog(@"\t\t\t\tword = %@", oneValue);
            }
        }
    }
    
    switch (attribute) {
        case AddWordFieldTypeName:
            break;
        case AddWordFieldTypeTranscription:
            break;
        case AddWordFieldTypeTranslation:
            break;
        default:
            break;
    }
    return @[];
}

@end
