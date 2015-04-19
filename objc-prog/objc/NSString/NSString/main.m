//
//  main.m
//  NSString
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", now];
        NSLog(@"%@", dateString);
        
        // Unicode
        NSString *lament = @"Why me?!";
        NSString *slogan = @"I \u2661 New York!";
        
        // String length
        NSUInteger charCount = [slogan length];
        NSLog(@"%ld", charCount);
       
        // Equality
        if ([slogan isEqualToString:lament]) {
            NSLog(@"%@ and %@ are equal", lament, slogan);
        } else {
            NSLog(@"%@ and %@ are not equal", lament, slogan);
        }
        
        NSLog(@"%@", [slogan uppercaseString]);
        
        // Substring match
        NSString *listOfNames = @"Tony Polly Shelly Vally";
        NSString *existingName = @"tony";
        NSString *nonExistingName = @"Vony";
        
        // Case insensitive search
        NSRange match = [listOfNames rangeOfString:existingName
                                           options:NSCaseInsensitiveSearch];
        // Case sensitive search
        NSRange noMatch = [listOfNames rangeOfString:nonExistingName];
        if (match.location != NSNotFound) {
            NSLog(@"Found %@ inside %@", existingName, listOfNames);
        }
        
        if (noMatch.location == NSNotFound) {
            NSLog(@"Did not found %@ inside %@", nonExistingName, listOfNames);
        }
    }
    return 0;
}
