//
//  Item.m
//  RandomItems
//
//  Created by Alexander Kudryashov on 14.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "Item.h"

@implementation Item

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc]
                                   initWithFormat:@"%@ (%@): Worth %d, recorded on %@",
                                   self.name,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

+ (instancetype)randomItem {
    NSArray *randomAdjectives = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNouns = @[@"Bear", @"Spork", @"Mac"];
    NSInteger adjectiveIndex = arc4random() % [randomAdjectives count];
    NSInteger nounIndex = arc4random() % [randomNouns count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectives[adjectiveIndex],
                            randomNouns[nounIndex]];
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                   '0' + arc4random() % 10,
                                   'A' + arc4random() % 26,
                                   '0' + arc4random() % 10,
                                   'A' + arc4random() % 26,
                                   '0' + arc4random() % 10];
    Item *randomItem = [[self alloc] initWithName:randomName
                                   valueInDollars:randomValue
                                     serialNumber:randomSerialNumber];
    return randomItem;
}

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber {
    self = [super init];
    
    if (self) {
        _name = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name
               valueInDollars:0
                 serialNumber:@""];
}

- (instancetype)init {
    return [self initWithName:@"Item"];
}

@end
