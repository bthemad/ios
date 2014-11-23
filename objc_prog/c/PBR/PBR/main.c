//
//  main.c
//  PBR
//
//  Created by Alexander Kudryashov on 19.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr)
{
    double rawFeet = meters * 3.281;
    double feet;
    double fractionalFoot = modf(rawFeet, &feet);
    
    if (ftPtr) {
        printf("Storing the number %d at %p\n", (int)feet, ftPtr);
        *ftPtr = feet;
    }
    
    double inches = fractionalFoot * 12.0;
    
    if (inPtr) {
        printf("Storing the inches %.3f at %p\n", inches, inPtr);
        *inPtr = inches;
    }
}

int main(int argc, const char * argv[]) {
    double meters = 1.78;
    unsigned int feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.2f meters is %d ft %.3f in\n", meters, feet, inches);
    
    return 0;
}
