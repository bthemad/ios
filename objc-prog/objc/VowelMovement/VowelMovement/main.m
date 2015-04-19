//
//  main.m
//  VowelMovement
//
//  Created by Alexander Kudryashov on 07.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun",
                                     @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"Original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        [originalStrings enumerateObjectsUsingBlock:^void (id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
        }];
        
        NSLog(@"devowerized strings: %@", devowelizedStrings);
    }
    return 0;
}
