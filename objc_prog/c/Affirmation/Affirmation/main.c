//
//  main.c
//  Affirmation
//
//  Created by Alexander Kudryashov on 15.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: Affirmation <adjective> <number>\n");
        return 1;
    }
    
    int count = atoi(argv[2]);
    
    for (int i; i < count; i++) {
        printf("You are %s!\n", argv[1]);
    }
    return 0;
}
