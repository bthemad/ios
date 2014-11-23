//
//  main.c
//  BMICalcHeap
//
//  Created by Alexander Kudryashov on 23.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

float calculateBodyMassIndex(Person *p)
{
    return p->weightInKilos / (p->heightInMeters * p->heightInMeters);
}

int main(int argc, const char * argv[]) {
    Person *alex = (Person *)malloc(sizeof(Person));
    alex->heightInMeters = 1.78;
    alex->weightInKilos = 70;
    
    float bmi = calculateBodyMassIndex(alex);
    printf("Alex's BMI is %.2f\n", bmi);
    
    free(alex);
    alex = NULL;
    
    return 0;
}
