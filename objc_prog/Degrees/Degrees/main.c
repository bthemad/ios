//
//  main.c
//  Degrees
//
//  Created by Alexander Kudryashov on 16.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

static float lastTemperature;

int fahrenheitFromCelsius(float cel)
{
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%.2f Celsius is %.2f Fahrenheit\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[])
{
    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezeInC);
    printf("Water freezes at %.2f degrees Fahrenheit.\n", freezeInF);
    printf("The last temperature converted was %.2f.\n", lastTemperature);
    
    return EXIT_SUCCESS;
}
