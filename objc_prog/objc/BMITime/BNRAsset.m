//
//  BNRAsset.m
//  BMITime
//
//  Created by Alexander Kudryashov on 04/12/14.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void) dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
