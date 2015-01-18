//
//  Item.h
//  RandomItems
//
//  Created by Alexander Kudryashov on 14.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject {
    int _valueInDollars;
}

@property (nonatomic) Item *containedItem;
@property (nonatomic) Item *container;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, readonly) NSDate *dateCreated;
@property (nonatomic) int valueInDollars;


+ (instancetype)randomItem;

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;
- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)sNumber;
- (instancetype)initWithName:(NSString *)name;

@end