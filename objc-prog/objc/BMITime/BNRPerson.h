//
//  BNRPerson.h
//  BMITime
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

// BNRPerson has a method that calculates BMI
- (float)bodyMassIndex;

@end
