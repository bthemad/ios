//
//  NSData+Speakable.h
//  SpeakableString
//
//  Created by Alexander Kudryashov on 15.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Speakable)

- (NSString *)encodeAsSpeakableString;
+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError **)e;

@end
