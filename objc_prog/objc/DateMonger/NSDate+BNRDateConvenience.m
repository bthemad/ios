//
//  NSDate+BNRDateConvenience.m
//  DateMonger
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "NSDate+BNRDateConvenience.h"

@implementation NSDate (BNRDateConvenience)

- (NSDate *)bnr_dateWithYear:(int)y month:(int)m day:(int)d {
    NSDateComponents *cmp = [[NSDateComponents alloc] init];

    [cmp setYear:y];
    [cmp setMonth:m];
    [cmp setDay:d];
    [cmp setHour:2];
    [cmp setMinute:0];
    [cmp setSecond:0];
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [cal dateFromComponents:cmp];
}

@end
