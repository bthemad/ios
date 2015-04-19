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
        NSMutableDictionary *executives =  [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNREmployee *employee = [[BNREmployee alloc] init];
            employee.weightInKilos = 90 + i;
            employee.heightInMeters = 1.8 - (i / 10.0);
            employee.employeeId = i;
            
            [employees addObject:employee];
            
            if (i == 0) {
                [executives setObject:employee forKey:@"CEO"];
            }
            if (i == 1) {
                [executives setObject:employee forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + (i * 17);
            
            NSUInteger randomIndex = random() % [employees count];
            
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAsset:asset];
            [allAssets addObject:asset];
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"
                                                              ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeId"
                                                              ascending:YES];
        [employees sortUsingDescriptors:@[voa, eid]];

        NSLog(@"Executives: %@", executives);
        NSLog(@"CEO: %@", executives[@"CEO"]);
        NSLog(@"Employees: %@", employees);
        
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"All assets: %@", allAssets);
        executives = nil;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 700"];
        NSArray *toBeReclained = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"to be reclaimed: %@", toBeReclained);
        toBeReclained = nil;
        
        NSLog(@"Giving up all employees");
        allAssets = nil;
        employees = nil;
    }
    
    return 0;
}
