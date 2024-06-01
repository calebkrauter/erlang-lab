#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int *createArrayRand(int, int);

/* initializes the random number generator. */
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

int square(int x)
{
    return x * x;
}

int isEven(int x)
{
    return x % 2 == 0;
}

int add(int x, int y) {
    return x + y;
}

int sum(int acc, int c) {
    return acc + c;
}

int increment(int acc, int c) {
    return acc + 1;
}

void printArray(int size, int arr[])
{
    int i;

    for (i = 0; i < size; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int *arrMap(int size, int *inArr, int(*func)(int)) {
    int *a = malloc(sizeof(int) * size);
    for (int i = 0; i < size; i++) {
        a[i] = func(inArr[i]);
    }

    return a;
}

int *arrFilter(int size, int *inArr, int(*pred)(int), int *newSize) {
    *newSize = 0;
    int *a = malloc(sizeof(int) * size);
    for (int i = 0; i < size; i++) {
        if (isEven(inArr[i])) {
            a[*newSize] = inArr[i];
            
            (*newSize)++;
        }
    }
    a = realloc(a, *newSize * sizeof(int));
    return a;
}

int arrReduce(int size, int *inArr, int(*func)(int, int), int starting) {
    int a = starting;
    for (int i = 0; i < size; i++) {
        a = func(a, inArr[i]);
    }
    return a;
}

int main()
{
    initRandom(); // Do not remove.

    // Feel free to edit
    const int SIZE = 10;
    int *arr = createArrayRand(SIZE, 26);
    printArray(SIZE, arr);


    printf("Original Array: ");
    int tempArray[5] = {1, 2, 3, 4, 5};
    printArray(5, tempArray);

    printf("Map Function Array: ");
    int *temp = arrMap(5, tempArray, square);
    printArray(5, temp);
    free(temp);

    printf("Filter Function Array: ");
    int val = 5;
    int *newSize = &val;
    int *temp1 = arrFilter(5, tempArray, isEven, newSize);
    printArray(*newSize, temp1);
    free(temp1);

    printf("Reduce Function Value: ");
    int temp2 = arrReduce(5, tempArray, sum, 0);
    printf("%d\n", temp2);
}

int *createArrayRand(int size, int exclusiveN)
{
    int *a = malloc(sizeof(int) * size);
    for (int i = 0; i < size; i++)
    {
        a[i] = nextInt(exclusiveN);
    }
    return a;
}
