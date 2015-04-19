//
//  BNRAppliance.m
//  Appliances
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, voltage: %d", self.productName, self.voltage];
}

- (instancetype)init {
    return [self initWithProductName:@"Unknown"];
}

- (instancetype)initWithProductName:(NSString *)productName {
    if (self = [super init]) {
        _voltage = 120;
        _productName = [productName copy];
    }

    return self;
}

- (void)setVoltage:(int)voltage {
    NSLog(@"Setting voltage to %d", voltage);
    _voltage = voltage;
}

@end
