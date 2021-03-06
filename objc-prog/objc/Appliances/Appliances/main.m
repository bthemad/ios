//
//  main.m
//  Appliances
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRAppliance *a = [[BNRAppliance alloc] init];
        [a setValue:@"Washing machine" forKey:@"productName"];
        [a setValue:[NSNumber numberWithInt:240] forKey:@"voltage"];
        NSLog(@"%@", a);
        NSLog(@"Product name is: %@", [a valueForKey:@"productName"]);
        BNRAppliance *b = [[BNRAppliance alloc] initWithProductName:@"Toaster"];
        NSLog(@"%@", b);
    }
    return 0;
}
