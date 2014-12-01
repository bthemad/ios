//
//  BNRForeignStockHolding.h
//  Stocks
//
//  Created by Alexander Kudryashov on 01.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "BNRStockHolding.h"

@interface BNRForeignStockHolding : BNRStockHolding

@property (nonatomic) float conversionRate;

@end