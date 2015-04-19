//
//  BNRLogger.m
//  Callbacks
//
//  Created by Alexander Kudryashov on 07.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"Created date formatter");
    }
    
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self willChangeValueForKey:@"lastTime"];
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

+ (NSSet *)keyPathsForValuesAffectingLastTimeString {
    return [NSSet setWithObject:@"lastTime"];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all");
    NSString *str = [[NSString alloc] initWithData:_incomingData
                                          encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"String has %lu chars", [str length]);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

@end
