//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Alexander Kudryashov on 05.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@implementation BNRPortfolio

- (void)addShare:(BNRStockHolding *)s
{
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
    }
    
    [_holdings addObject:s];
}

- (NSArray *)holdings
{
    return [_holdings copy];
}

- (float)currentValue
{
    float currentValue = 0;
    if (self.holdings) {
        for (BNRStockHolding *share in self.holdings) {
            currentValue += [share valueInDollars];
        }
    }
    
    return currentValue;
}

@end
