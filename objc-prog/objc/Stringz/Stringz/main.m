//
//  main.m
//  Stringz
//
//  Created by Alexander Kudryashov on 06.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSError *readError;
        NSString *readStr = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                            encoding:NSASCIIStringEncoding
                                                               error:&readError];
        if (!readStr) {
            NSLog(@"Read failed: %@", [readError localizedDescription]);
        } else {
            NSLog(@"resolv.conf: %@", readStr);
        }
        
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Alex is cool\n"];
        }
        NSError *writeError;
        
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&writeError];
        
        if (success) {
            NSLog(@"done writing to /tmp/cool.txt");
        } else {
            NSLog(@"writing to /tmp/cool.txt failed: %@", [writeError localizedDescription]);
        }
    }
    return 0;
}
