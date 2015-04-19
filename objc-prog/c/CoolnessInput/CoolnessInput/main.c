//
//  main.c
//  CoolnessInput
//
//  Created by Alexander Kudryashov on 19.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <readline/readline.h>

int main(int argc, const char * argv[]) {
    const char *name = readline("Who is cool? ");
    printf("%s is cool.\n", name);
    return 0;
}
