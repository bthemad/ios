//
//  Container.h
//  RandomItems
//
//  Created by Alexander Kudryashov on 18.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "Item.h"

@interface Container : Item

@property (nonatomic, readonly) NSArray *items;

-(instancetype)initWithName:(NSString *)name
             valueInDollars:(int)value
               serialNumber:(NSString *)sNumber
                      items:(NSArray *)items;

@end