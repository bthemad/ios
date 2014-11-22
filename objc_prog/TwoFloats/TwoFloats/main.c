//
//  main.c
//  TwoFloats
//
//  Created by Alexander Kudryashov on 16.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    float f1 = 3.149;
    float f2 = 42.0;
    double d1 = f1 + f2;
    
    printf("The result is: %.2f\n", d1);
    
    return 0;
}
