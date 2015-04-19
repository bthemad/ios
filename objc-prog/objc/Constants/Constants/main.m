//
//  main.m
//  Constants
//
//  Created by Alexander Kudryashov on 06.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\u03c0 is %f", M_PI);
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencySymbol];
        NSLog(@"Money is %@", currency);
    }
    return 0;
}
