//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNROwnedAppliance.h"
@interface BNROwnedAppliance ()
{
    NSMutableSet *_ownerNames;
}
@end

@implementation BNROwnedAppliance

- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n {
    if (self = [super initWithProductName:pn]) {
        _ownerNames = [[NSMutableSet alloc] init];

        if (n) {
            [_ownerNames addObject:n];
        }
    }

    return self;
}

- (instancetype)initWithProductName:(NSString *)productName {
    return [self initWithProductName:productName firstOwnerName:nil];
}

- (void)addOwnerName:(NSString *)n {
    [_ownerNames addObject:n];
}

- (void)removeOwnerName:(NSString *)n {
    [_ownerNames removeObject:n];
}

- (NSSet *)ownerNames {
    return [_ownerNames copy];
}

@end
