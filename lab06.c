#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
// Caleb Krauter, Corey Young, Zach Anderson

double sqrtApprox(double n);
double sqrtApproxHelper(double n, double m);
//*int createArray(int size, int initVal);


/* Initializes the random number generator. */
void initRandom()
{
    time_t t;
    srand((unsigned)time(&t));
}

/* Return a random number from [0 - n) (exclusive of n) */
int nextInt(int n)
{
    return rand() % n;
}

double sqrtApprox(double n) {
    return sqrtApproxHelper(fabs(n), fabs(n));
}

double sqrtApproxHelper(double n, double m) {
	double temp = fabs(n - (m * m));
	if (temp < 0.0001) {
		return m;
	} else {
		return sqrtApproxHelper(n, (m + (n / m)) / 2);	
	}
	
}

void sqrtApproxOut(double n, double *m) {
	double temp = fabs(n - (*m * *m));
	if (fabs(temp) >= 0.0001) {
		*m = (*m + (n / *m)) / 2;
		sqrtApproxOut(n, m);
	}
}

void sqrtApproxInOut(double *n) {
	double m = *n;
	while (fabs(*n - (m * m)) >= 0.0001) {
		m = (m + (* n / m)) / 2;
	}
	*n = m;
}

void minMax(double *a, double *b) {
	if (*a > *b) {
		double temp = *a;
		*a = *b;
		*b = temp;
	}
}

int *createArray(int size, int initialValue) {
	int *result  = malloc(size * sizeof(int));
	int i;
	for (i = 0; i < size; i++) {
		*(result + i) = initialValue;
	}
	return result;
}

int *createArrayRand(int size, int exclusiveN) {
	int *result  = malloc(size * sizeof(int));
	int i;
	initRandom();
	for (i = 0; i < size; i++) {
		result[i] =  rand() % exclusiveN;
	}
	return result;
}

double *sqrtArray(int size, int *array) {
	double *result  = malloc(size * sizeof(double));
	int i;
	for (i = 0; i < size; i++) {
		result[i] = sqrtApprox((double) array[i]);
	}
	return result;
}
int main()
{
    initRandom(); // Do not remove.
    printf("%d\n", nextInt(101));
    printf("sqrt of 4 is: %f\n", sqrtApprox(4));
    printf("sqrt of 16 is: %f\n", sqrtApprox(16));
    printf("sqrt of random is: %f\n", sqrtApprox(nextInt(101)));
    printf("sqrt of is: 13.1231 %f\n", sqrtApprox(13.1231));
    printf("sqrt of -166 is: %f\n", sqrtApprox(-166));
    double x = 100202.12;
    double *n = &x;
    sqrtApproxOut(*n, n);
    printf("%f", *n);
      printf("sqrt  %f\n", *n);
      sqrtApproxOut(*n, n);
    printf("sqrt %f\n", *n);
    sqrtApproxOut(*n, n);
    printf("sqrt %f\n", *n);
    sqrtApproxOut(*n, n);
    printf("sqrt %f\n", *n);
    sqrtApproxOut(*n, n);
    printf("sqrt %f\n", *n);
    double y = 16;
    double *m = &y;
    sqrtApproxOut(*m, m);
    printf("sqrt %f\n", *m);
   
    double z = 256;
    double *o = &z;
    sqrtApproxInOut(o);
    printf("sqrt of 256 is %f\n", *o);
    sqrtApproxInOut(o);
    printf("%f\n", *o);
    sqrtApproxInOut(o);
    printf("%f\n", *o);
    *o = 12.023;
    sqrtApproxInOut(o);
    printf("sqrt of 12.023 is %f\n", *o);
    *o = 143;
    sqrtApproxInOut(o);
    printf("sqrt of 143 is %f\n", *o);
    double min = -10;
    double max = 13;
    double *minPt = &max;
    double *maxPt = &min;
    printf("initially lesser value: minPt %f\ninitially greater value maxPt %f\n", *minPt, *maxPt);
    minMax(minPt, maxPt);
    printf("Updated pointers: minPt %f\nmaxPt %f\n", *minPt, *maxPt);
    
    double min2 = 10;
    double max2 = -13;
    double *minPt2 = &max2;
    double *maxPt2 = &min2;
    printf("initially lesser value: minPt %f\ninitially greater value maxPt %f\n", *minPt2, *maxPt2);
    minMax(minPt2, maxPt2);
    printf("Updated pointers: minPt %f\nmaxPt %f\n", *minPt2, *maxPt2);
   
    unsigned int size = 10;
    unsigned int initVal = 3;
    int *arrayInitialized = createArray(size, initVal);
    for (unsigned int i = 0; i < size; i++) {
    	printf("%d, ", *(arrayInitialized + i));
    }
    free(arrayInitialized);
    
    unsigned int size2 = 10;
    unsigned int exclusiveN = 15;
    int *arrayInitialized2 = createArrayRand(size2, exclusiveN);
    for (unsigned int i = 0; i < size2; i++) {
    	printf("%d, ", *(arrayInitialized2 + i));
    }
    printf("\n");
    double *arrayOfSqrts = sqrtArray(size2, arrayInitialized2);
    for (unsigned int i = 0; i < size2; i++) {
    	printf("%.2f, ", arrayOfSqrts[i]);
    }
    free(arrayOfSqrts);
    free(arrayInitialized2);

}
