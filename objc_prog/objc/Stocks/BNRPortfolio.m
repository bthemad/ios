//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Alexander Kudryashov on 05.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio ()

{
    NSMutableArray *_holdings;
}

@end

@implementation BNRPortfolio

- (void)addShare:(BNRStockHolding *)s
{
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
    }
    
    [_holdings addObject:s];
}

- (void)removeShare:(BNRStockHolding *)s
{
    if (_holdings && [_holdings containsObject:s]) {
        [_holdings removeObject:s];
    }
}

- (NSArray *)holdings
{
    return [_holdings copy];
}

- (NSArray *)topHoldings
{
    NSSortDescriptor *valueSort = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSArray *sortedHoldings = [self.holdings sortedArrayUsingDescriptors:@[valueSort]];
    return [sortedHoldings subarrayWithRange:NSMakeRange(0, 3)];
}

- (NSArray *)sortedHoldings
{
    NSSortDescriptor *labelSort = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    return [self.holdings sortedArrayUsingDescriptors:@[labelSort]];
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
