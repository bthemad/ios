//
//  main.m
//  SpeakableString
//
//  Created by Alexander Kudryashov on 15.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+Speakable.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Generate 8 bytes of random data
        srandom((unsigned int)time(NULL));
        int64_t randomBytes = (random() << 32) | random();
        
        // Pack it in an NSData
        NSData *inData = [NSData dataWithBytes:&randomBytes length:sizeof(int64_t)];
        NSLog(@"In Data = %@", inData);
        
        // Convert to speakable string
        NSString *speakable = [inData encodeAsSpeakableString];
        NSLog(@"Got string \"%@\"", speakable);
        
        // Convert back to NSData
        NSError *err;
        NSData *outData = [NSData dataWithSpeakableString:speakable error:&err];
        
        if (!outData) {
            NSLog(@"Unexpected error: %@", [err localizedDescription]);
            return -1;
        }
        NSLog(@"Out data: %@", outData);
        
        if (![outData isEqual:inData]) {
            NSLog(@"Data coming out not the same as what went in.");
            return -1;
        }
        
        speakable = @"2 Jeep 3 Halo 7 Teevo 2 Pepsi 2 Volvo";
        outData = [NSData dataWithSpeakableString:speakable error:&err];
        if (!outData) {
            NSLog(@"Expected error: %@", [err localizedDescription]);
        } else {
            NSLog(@"Missed bad string");
            return -1;
        }
    }
    return 0;
}
