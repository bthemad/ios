//
//  main.m
//  Coolness
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        const char *raw_name = readline("Who is cool? ");
        NSString *name = [NSString stringWithUTF8String:raw_name];
        NSLog(@"%@ is cool", name);
    }
    return 0;
}
