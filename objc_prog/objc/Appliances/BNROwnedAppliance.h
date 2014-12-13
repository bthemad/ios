//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance

@property (nonatomic, readonly) NSSet *ownerNames;

// The designated initialiser
- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n;
- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end
