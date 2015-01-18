//
//  main.m
//  RandomItems
//
//  Created by Alexander Kudryashov on 14.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];

        for (int i = 0; i < 10; i++) {
            [items addObject:[Item randomItem]];
        }
        
        for (Item *item in items) {
            NSLog(@"%@", item);
        }
        
        items = nil;
    }
    return 0;
}
