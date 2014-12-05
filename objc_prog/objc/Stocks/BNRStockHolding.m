//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Stock %@: cost: %.2f, value: %.2f",
            self.symbol, [self costInDollars], [self valueInDollars]];
}

@end
