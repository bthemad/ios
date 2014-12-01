//
//  BNREmployee.m
//  BMITime
//
//  Created by Alexander Kudryashov on 01.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double) yearsOfEmployment
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
    return [NSString stringWithFormat:@"<Employee #%d>", self.employeeId];
}

@end
