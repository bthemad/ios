//
//  main.m
//  BMITime
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNREmployee *employee = [[BNREmployee alloc] init];
            employee.weightInKilos = 90 + i;
            employee.heightInMeters = 1.8 - (i / 10.0);
            employee.employeeId = i;
            
            [employees addObject:employee];
        }
        
        for (int i = 0; i < 10; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + (i * 17);
            
            NSUInteger randomIndex = random() % [employees count];
            
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAsset:asset];
        }
        
        BNRAsset *tempAsset = [[BNRAsset alloc] init];
        tempAsset.label = @"Tons of gold";
        tempAsset.resaleValue = 10000;
        BNREmployee *tempEmployee = [employees objectAtIndex:7];
        [tempEmployee addAsset:tempAsset];
        [tempEmployee removeAsset:tempAsset];
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"Giving up all employees");
        employees = nil;
    }
    return 0;
}
