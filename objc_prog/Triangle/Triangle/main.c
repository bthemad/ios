//
//  main.c
//  Triangle
//
//  Created by Alexander Kudryashov on 16.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

float remainingAngle(float a, float b)
{
    if ((a + b) > 180) {
        printf("Sum of two angles can't be more than 180\n");
        return -1;
    }
    return 180 - a - b;
}

int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    if (angleC != -1) {
        printf("The third angle is %.2f\n", angleC);
    }
    
    return 0;
}
