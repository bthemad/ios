//
//  BNREmployee.m
//  BMITime
//
//  Created by Alexander Kudryashov on 01.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@implementation BNREmployee

- (void) setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    if (!_assets) {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
    NSLog(@"Added an asset");
}

- (void)removeAsset:(BNRAsset *)a
{
    if (_assets) {
        [_assets removeObject:a];
        NSLog(@"Asset got removed");
    }
}

- (unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    
    return sum;
}

- (double)yearsOfEmployment
{
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / (60 * 60 * 24 * 365.242);
    } else {
        return 0;
    }
}

- (float) bodyMassIndex
{
    float normalBmi = [super bodyMassIndex];
    return normalBmi * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee #%u: %u in assets>",
            self.employeeId, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
