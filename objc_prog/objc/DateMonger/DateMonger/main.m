//
//  main.m
//  DateMonger
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+BNRDateConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *d = [[NSDate alloc] init];
        NSDate *y = [d bnr_dateWithYear:1984 month:6 day:28];
        NSLog(@"Date: %@", y);
    }
    return 0;
}
