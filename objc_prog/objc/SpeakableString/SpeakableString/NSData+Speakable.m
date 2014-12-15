//
//  NSData+Speakable.m
//  SpeakableString
//
//  Created by Alexander Kudryashov on 15.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "NSData+Speakable.h"

@implementation NSData (Speakable)

- (NSString *)encodeAsSpeakableString {
    return @"Testing";
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError *__autoreleasing *)e {
    int64_t tst = 0xff;
    return [NSData dataWithBytes:&tst length:4];
}

@end
