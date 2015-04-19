//
//  main.c
//  yostring
//
//  Created by Alexander Kudryashov on 14.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // malloc
#include <string.h> // strlen

int spaceCount(const char *str) {
    int i = 0;
    int spaceCnt = 0;
    while (str[i] != '\0') {
        if (str[i] == 0x20) {
            spaceCnt++;
        }
        i++;
    }
    
    return spaceCnt;
}

int main(int argc, const char * argv[]) {
    char x = '!'; // "!" char
    while (x <= '~') {
        printf("%x is %c\n", x, x);
        x++;
    }
    
    const char *start = "Love";
    
    printf("%s has %zu characters\n", start, strlen(start));
    printf("The third letter is %c\n", start[2]);
    
    const char *sentence = "He was not in the cab at the time.";
    printf("\"%s\" has %d spaces\n", sentence, spaceCount(sentence));
    
    return 0;
}
