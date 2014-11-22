//
//  main.c
//  BeerSong
//
//  Created by Alexander Kudryashov on 16.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

void singSongFor(int numberOfBottles)
{
    if (numberOfBottles == 0) {
        printf("There are simply no more bottles of beer on the wall.\n\n");
    } else {
        printf("%d bottles of beer on the wall. %d bottles of beer on the wall.\n",
               numberOfBottles, numberOfBottles);
        int oneFever = numberOfBottles - 1;
        printf("Take one down, pass it around, %d bottles of beer on the wall.\n\n",
               oneFever);
        singSongFor(oneFever);
        
        printf("Put a bottle in the recycling, %d empty bottles in the bin.\n",
               numberOfBottles);
    }
}

int main(int argc, const char * argv[])
{
    singSongFor(4);
    return 0;
}
