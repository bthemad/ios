//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Alexander Kudryashov on 05.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSObject

@property (nonatomic, readonly, copy) NSArray *holdings;

- (void)addShare:(BNRStockHolding *)s;
- (void)removeShare:(BNRStockHolding *)s;
- (float)currentValue;
- (NSArray *)topHoldings;
- (NSArray *)sortedHoldings;

@end
