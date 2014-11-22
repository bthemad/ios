//
//  main.c
//  CountDown
//
//  Created by Alexander Kudryashov on 19.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>

int main(int argc, const char * argv[]) {
    int input = 0;
    input = atoi(readline("What would be your number? "));
    for (int i = input; i >= 0; i -= 3) {
        printf("%d.\n", i);
        if (i % 5 == 0) {
            printf("Found one!\n");
        }
    }
    return 0;
}
