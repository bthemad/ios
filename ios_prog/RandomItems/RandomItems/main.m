//
//  main.m
//  RandomItems
//
//  Created by Alexander Kudryashov on 14.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Container.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];

        for (int i = 0; i < 2; i++) {
            [items addObject:[Item randomItem]];
        }
        
        NSMutableArray *moreItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < 2; i++) {
            [moreItems addObject:[Item randomItem]];
        }
        Container *smallBox = [[Container alloc] initWithName:@"Small box" valueInDollars:5 serialNumber:@"SNNN" items:moreItems];
        
        [items addObject:smallBox];
        
        Item *it = [[Item alloc] initWithName:@"it" serialNumber:@"SN"];
        NSLog(@"%@", it);
        
        Container *container = [[Container alloc] initWithName:@"Container" valueInDollars:5 serialNumber:@"SNN" items:items];
        
        NSLog(@"%@", container);
        
        items = nil;
    }
    return 0;
}
