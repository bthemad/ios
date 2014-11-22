//
//  main.c
//  FutureTime
//
//  Created by Alexander Kudryashov on 22.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[]) {
    long ts = time(NULL);
    long ts_future = ts + 1000000;
    
    struct tm now;
    struct tm future;
    localtime_r(&ts, &now);
    localtime_r(&ts_future, &future);

    printf("Now it is %d-%d-%d\n", now.tm_mday, now.tm_mon + 1, now.tm_year + 1900);
    printf("In million seconds it will be %d-%d-%d\n", future.tm_mday, future.tm_mon + 1, future.tm_year + 1900);
    
    return 0;
}
