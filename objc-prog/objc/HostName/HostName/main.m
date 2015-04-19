//
//  main.m
//  HostName
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *host = [NSHost currentHost];
        NSString *hostname = [host localizedName];
        NSLog(@"Hostname is: %@", hostname);
    }
    return 0;
}
