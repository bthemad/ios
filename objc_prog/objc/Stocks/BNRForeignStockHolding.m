//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Alexander Kudryashov on 01.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

- (float)costInDollars
{
    return [super costInDollars] * [self conversionRate];
}

- (float)valueInDollars
{
    return [super valueInDollars] * [self conversionRate];
}

@end
