//
//  main.m
//  BMITime
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRPerson *mikey =  [[BNRPerson alloc] init];
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"Mike is %.2f meters tall and weight %d kilos", height, weight);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"Mike's BMI is: %.2f", bmi);
    }
    return 0;
}
