//
//  main.c
//  4Challenge
//
//  Created by Alexander Kudryashov on 16.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 20;
    int j = 25;
    int k = (i > j) ? 10 : 5;
    
    if (5 < j - k) {
        printf("The first condition is true.\n");
    } else if (j > 1) {
        printf("The second condition is true.\n");
    } else {
        printf("Neither is true");
    }
    
    return 0;
}
