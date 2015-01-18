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

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, readonly) NSDate *dateCreated;

+ (instancetype)randomItem;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;
- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)sNumber;
- (instancetype)initWithName:(NSString *)name;

@end