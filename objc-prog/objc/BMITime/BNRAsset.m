//
//  BNRAsset.m
//  BMITime
//
//  Created by Alexander Kudryashov on 04/12/14.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

- (NSString *) description
{
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",
                self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d, unassigned>",
                self.label, self.resaleValue];
    }
}

- (void) dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
