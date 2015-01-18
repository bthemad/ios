//
//  Container.m
//  RandomItems
//
//  Created by Alexander Kudryashov on 18.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "Container.h"

@implementation Container

-(instancetype)initWithName:(NSString *)name
             valueInDollars:(int)value
               serialNumber:(NSString *)sNumber
                      items:(NSArray *)items {
    self = [super initWithName:name valueInDollars:value serialNumber:sNumber];
    _items = items;
    
    return self;
}

- (int)valueInDollars {
    int totalValue = _valueInDollars;
    for (Item *item in self.items) {
        totalValue += item.valueInDollars;
    }
    
    return totalValue;
}

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"Container of value %d with items: [\n", self.valueInDollars];
    
    for (Item *item in self.items) {
        descriptionString = [descriptionString stringByAppendingString:[NSString stringWithFormat:@"%@\n", item]];
    }
    
    descriptionString = [descriptionString stringByAppendingString:@"]\n"];
    
    return descriptionString;
}

@end
