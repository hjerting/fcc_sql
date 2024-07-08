#include<stdio.h>

int main(void)
{
    struct Car {
    char *name;
    int engineVolume;
    };

    typedef struct Car sportsCar;
    sportsCar ferrari;
    ferrari.name = "LaFerrari";
    ferrari.engineVolume = 6262;

    return 0;
}