//
//  main.m
//  Callbacks
//
//  Created by Alexander Kudryashov on 07.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification
                                                          object:nil
                                                           queue:nil
                                                      usingBlock:^void (NSNotification *note) {
            NSLog(@"Time zone changed");
        }];
        
        NSURL *url = [NSURL URLWithString:
                      @"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchCon =
        [[NSURLConnection alloc] initWithRequest:request
                                        delegate:logger
                                startImmediately:YES];
        
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                 target:logger
                                               selector:@selector(updateLastTime:)
                                               userInfo:nil
                                                repeats:YES];
        
        __unused BNRObserver *observer = [[BNRObserver alloc] init];
        
        [logger addObserver:observer
                 forKeyPath:@"lastTimeString"
                    options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                    context:nil];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
