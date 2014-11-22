//
//  main.c
//  Addresses
//
//  Created by Alexander Kudryashov on 19.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 17;
    int *addressOfI = &i;
    short s = 32767;
    unsigned short us = 65535;
    printf("%d and %d\n", s, us);
    printf("i stores its value at %p\n", addressOfI);
    printf("The value of i is %d\n", *addressOfI);
    *addressOfI = 89;
    printf("The value of i is %d\n", *addressOfI);
    printf("An int is %zu bytes\n", sizeof(i));
    printf("A pointer is %zu bytes\n", sizeof(addressOfI));
    printf("A float is %zu bytes\n", sizeof(float));
    printf("main is at %p\n", main);
    return 0;
}
