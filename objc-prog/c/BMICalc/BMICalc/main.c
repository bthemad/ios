//
//  main.c
//  BMICalc
//
//  Created by Alexander Kudryashov on 22.11.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#include <stdio.h>

typedef struct {
    char *name;
    float heightInMeters;
    int weightInKilos;
}  Person;

float calculateBodyMassIndex(Person p)
{
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

void printPersonParams(Person p)
{
    float bmi = calculateBodyMassIndex(p);
    printf("%s is %.2f meters tall\n", p.name, p.heightInMeters);
    printf("%s weights %d kilograms\n", p.name, p.weightInKilos);
    printf("%s BMI is %.2f\n", p.name, bmi);
}

int main(int argc, const char * argv[])
{
    Person mikey;
    mikey.name = "Mikey";
    mikey.heightInMeters = 1.7;
    mikey.weightInKilos = 96;
    
    Person aaron;
    aaron.name = "Aaron";
    aaron.heightInMeters = 1.97;
    aaron.weightInKilos = 84;
    
    Person alex;
    alex.name = "Alex";
    alex.heightInMeters = 1.78;
    alex.weightInKilos = 70;
    
    printPersonParams(mikey);
    printPersonParams(aaron);
    printPersonParams(alex);
    
    return 0;
}
