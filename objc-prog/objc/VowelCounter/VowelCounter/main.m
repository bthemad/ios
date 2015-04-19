//
//  main.m
//  VowelCounter
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"Hello, world";
        NSLog(@"String %@ has %d vowels", str, [str bnr_vowelCount]);
    }
    return 0;
}
