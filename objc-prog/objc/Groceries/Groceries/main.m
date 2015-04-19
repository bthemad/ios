//
//  main.m
//  Groceries
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *groceries = [NSMutableArray array];
        [groceries addObject:@"Loaf of bread"];
        [groceries addObject:@"Container of milk"];
        [groceries addObject:@"Stick of butter"];
        
        NSLog(@"My grocery list is: ");
        for (NSString *item in groceries) {
            NSLog(@"%@", item);
        }
    }
    return 0;
}
