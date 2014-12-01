//
//  main.m
//  BMITime
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNREmployee *mikey =  [[BNREmployee alloc] init];
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        [mikey setEmployeeId:12];
        NSDateFormatter *dateFormat =  [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        [mikey setHireDate:[dateFormat dateFromString:@"2013-02-24"]];

        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"Mike is %.2f meters tall and weight %d kilos", height, weight);
        NSLog(@"%@, hired on %@", mikey, mikey.hireDate);
        NSLog(@"Years of employment: %.2f", [mikey yearsOfEmployment]);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"Mike's BMI is: %.2f", bmi);
    }
    return 0;
}
