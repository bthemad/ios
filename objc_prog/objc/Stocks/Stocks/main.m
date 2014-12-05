//
//  main.m
//  Stocks
//
//  Created by Alexander Kudryashov on 26.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];

        BNRStockHolding *share1 =  [[BNRStockHolding alloc] init];
        [share1 setPurchaseSharePrice:2.3];
        [share1 setCurrentSharePrice:4.5];
        [share1 setNumberOfShares:40];
        [share1 setSymbol:@"ABC"];
        [portfolio addShare:share1];
        
        BNRStockHolding *share2 =  [[BNRStockHolding alloc] init];
        [share2 setPurchaseSharePrice:12.19];
        [share2 setCurrentSharePrice:10.56];
        [share2 setNumberOfShares:90];
        [share2 setSymbol:@"XYZ"];
        [portfolio addShare:share2];

        BNRForeignStockHolding *share3 = [[BNRForeignStockHolding alloc] init];
        [share3 setPurchaseSharePrice:2.30];
        [share3 setCurrentSharePrice:4.50];
        [share3 setNumberOfShares:40];
        [share3 setConversionRate: 0.94];
        [share3 setSymbol:@"LMN"];
        [portfolio addShare:share3];
        
        
        NSLog(@"Total portfolio value is: %.2f", [portfolio currentValue]);
        
        for (BNRStockHolding *share in [portfolio holdings]) {
            NSLog(@"%@", share);
        }
    }
    return 0;
}
