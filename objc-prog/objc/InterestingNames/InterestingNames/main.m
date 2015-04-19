//
//  main.m
//  InterestingNames
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *words_raw = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                    encoding:NSUTF8StringEncoding
                                                       error:NULL];
        NSArray *words = [words_raw componentsSeparatedByString:@"\n"];
        
        NSString *names_raw = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                    encoding:NSUTF8StringEncoding
                                                       error:NULL];
        NSArray *names = [names_raw componentsSeparatedByString:@"\n"];
        
        NSMutableArray *candidate_names = [NSMutableArray array];
        
        NSUInteger word_count = [words count];
        for (int i = 0; i < word_count - 1; i++) {
            NSString *currentWord = [words[i] capitalizedString];
            NSString *nextWord = [words[i + 1] capitalizedString];
            if ([currentWord isEqualToString:nextWord] && [names containsObject:currentWord]) {
                [candidate_names addObject:currentWord];
            }
        }
        
        for (NSString *name in candidate_names) {
            NSLog(@"%@", name);
        }
    }
    return 0;
}
