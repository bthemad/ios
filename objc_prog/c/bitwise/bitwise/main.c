//
//  main.c
//  bitwise
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//assumes little endian
void printBits(size_t const size, void const * const ptr)
{
    unsigned char *b = (unsigned char*) ptr;
    unsigned char byte;
    int i, j;
    
    for (i = size - 1; i >= 0; i--) {
        for (j = 7; j >= 0; j--) {
            byte = b[i] & (1<<j);
            byte >>= j;
            printf("%u", byte);
        }
    }
    puts("");
}

int main(int argc, const char * argv[]) {
    unsigned char a = 0x3C;
    unsigned char b = 0xA9;
    unsigned char c = a | b;
    
    printf("hex: %x | %x = %x\n", a, b, c);
    printf("dec: %d | %d = %d\n", a, b, c);
    
    unsigned char d = a & b;
    
    printf("hex: %x & %x = %x\n", a, b, d);
    printf("dec: %d & %d = %d\n", a, b, d);
    
    uint64_t n = 0x1;
    for (int i = 0; i < 31; i++) {
        n = n << 2;
        n = n | 0x1;
    }
    printBits(sizeof(n), &n);
    printf("%lld\n", n);
    
    return 0;
}
