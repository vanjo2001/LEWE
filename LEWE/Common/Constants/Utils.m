//
//  Utils.m
//  LEWE
//
//  Created by IvanLyuhtikov on 19.12.20.
//

#import "Utils.h"

void VALog(NSString *format, ...) {
#ifdef PRINT
    va_list list;
    va_start(list, format);
    
    NSLogv(format, list);
    
    va_end(list);
#endif
}
