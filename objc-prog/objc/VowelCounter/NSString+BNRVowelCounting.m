//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)

- (int)bnr_vowelCount {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSInteger count = [self length];
    int sum = 0;
    for (int i = 0; i < count; i++) {
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]) {
            sum++;
        }
    }
    
    return sum;
}

@end
