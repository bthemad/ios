//
//  main.m
//  TimesTwo
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        
        NSDate *startTime = currentTime;

        sleep(1);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is now %p", currentTime);
        NSLog(@"startTime's value is still %p", startTime);
        
        currentTime = nil;
        NSLog(@"currentTime's value is now %p", currentTime);
    }
    return 0;
}
