//
//  BNRStockHolding.h
//  Stocks
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic, copy) NSString *symbol;

- (float)costInDollars;
- (float)valueInDollars;

@end
