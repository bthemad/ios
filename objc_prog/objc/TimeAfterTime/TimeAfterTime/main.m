//
//  main.m
//  TimeAfterTime
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);

        double seconds = [[NSDate date] timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);

        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 1000000 seconds it will be %@", later);

        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [calendar calendarIdentifier]);
        unsigned long day = [calendar ordinalityOfUnit:NSCalendarUnitDay
                                                inUnit:NSCalendarUnitMonth
                                               forDate:now];
        NSLog(@"Day of the month: %ld", day);
    }
    return 0;
}
