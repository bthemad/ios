//
//  main.m
//  DateList
//
//  Created by Alexander Kudryashov on 25.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60 * 60];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60 * 60];
        
        NSArray *dateList = @[now, tomorrow, yesterday];
        NSMutableArray *mdateList = [NSMutableArray array];
        
        [mdateList addObject:now];
        [mdateList addObject:tomorrow];
        [mdateList insertObject:yesterday atIndex:0];
        
        for (NSDate *d in dateList) {
            NSLog(@"Here is a date: %@", d);
        }
        
        for (NSDate *d in mdateList) {
            NSLog(@"Here is mutable date %@", d);
        }
        
        NSLog(@"%lu", [mdateList count]);
        [mdateList removeObjectAtIndex:0];
        NSLog(@"%lu", [mdateList count]);
        NSLog(@"%@", mdateList[0]);
    }
    return 0;
}
