//
//  BNREmployee.h
//  BMITime
//
//  Created by Alexander Kudryashov on 01.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeId;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;

- (double) yearsOfEmployment;
- (void) addAsset:(BNRAsset *)a;
- (void)removeAsset:(BNRAsset *)a;
- (unsigned int) valueOfAssets;

@end
