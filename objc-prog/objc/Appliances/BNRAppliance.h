//
//  BNRAppliance.h
//  Appliances
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)productName;

@end
