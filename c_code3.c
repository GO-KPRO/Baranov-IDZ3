#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>

int open(char* filename, unsigned long* accuracy, unsigned long* decimal)
{
    FILE *input;
    input = fopen(filename, "r");
    if (input == NULL) {
        printf("Error: there is no such file in directory");
        return EOF;
    }
    return fscanf(input, "%lu %lu", accuracy, decimal);
}

void generate(unsigned long* accuracy, unsigned long* decimal)
{
    srand(time(NULL));
    srand(rand());
    *accuracy = 1000 + rand();
    *decimal = rand() % 17;
}

unsigned long factorial(unsigned long n) {
    unsigned long res = 1;
    for (unsigned long i = 2; i <= n; ++i) {
        res *= i;
    }
    return res;
}

int main(int argc, char* argv[])
{
    clock_t beg_time = clock();

    const double e = exp(1);
    unsigned long accuracy;
    unsigned long decimal;

    FILE* output_file;
    if (argc == 1)
    {
        generate(&accuracy, &decimal);
        output_file = fopen("Ranom_output.txt", "w");
    } else if (argc == 2) {
        if (open(argv[1], &accuracy, &decimal) == EOF) {
            return 0;
        }
        output_file = fopen("File_output.txt", "w");
    } else {
        printf("Error: too many args");
        return 0;
    }

    double res = 0;
    unsigned long n = 0;
    while ((res - e) * (res - e) > (e / accuracy) * (e / accuracy)) {
        res += 1.0 / factorial(n);
        ++n;
    }
    fprintf(output_file, "%.*f", (int)decimal, res);
    clock_t end_time = clock();
    printf("Operating time of the program: %f\n", (double)(end_time - beg_time) / CLOCKS_PER_SEC);
    return 0;
}
