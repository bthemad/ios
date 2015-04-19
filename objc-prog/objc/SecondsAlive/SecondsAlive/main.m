//
//  main.m
//  SecondsAlive
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];

        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1984];
        [comps setMonth:6];
        [comps setDay:28];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *bd = [g dateFromComponents:comps];
        
        NSLog(@"Seconds since birthday: %lf", [now timeIntervalSinceDate:bd]);
    }
    return 0;
}
