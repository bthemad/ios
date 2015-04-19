//
//  main.c
//  Numbers
//
//  Created by Alexander Kudryashov on 17.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include <objc/NSObjCRuntime.h>

int main(int argc, const char * argv[])
{
    double y = 12345.6789;
    printf("y is %.2f\n", y);
    printf("y is %.2e\n", y);
    
    double z = 1;
    printf("sin(1) radian is %.3f.\n", sin(z));
    
    NSInteger a = 5;
    NSUInteger b = 10;
    
    printf("Here we go: %ld, %ld.\n", (long) a, (unsigned long) b);
    
    return 0;
}
