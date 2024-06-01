#include <stdio.h>
#include <stdlib.h>

char *addCommas(char *string) {
    int size = 0;
    while (string[size] != '\0') {
        size++;
        
    }

    int newSize = (size + ((size - 2) / 3));

    if (size > 3) {
        newSize++;
    }
    
    char *arr = malloc(sizeof(char) * newSize);
    
    int j = 0;
    for (int i = 0; i <= newSize; i++) {
        if (i != 0 && i % 4 == 0) {
            arr[newSize - i] = ',';
        } else {
            arr[newSize - i] = string[size - j];
            j++;
        }
    }

    return arr;
}

void printArray(int size, char arr[])
{
    int i;

    for (i = 0; i < size; i++)
    {
        printf("%c ", arr[i]);
    }
    printf("\n");
}

int main() {

    char val[9] = {'1', '5', '3', '2', '7', '9', '0'};
    printf("Original String: ");
    printArray(9, val);
    printf("Add Commas String: ");
    char *temp = addCommas(val);
    printArray(11, temp);
    free(temp);

    printf("\n");

    char val1[4] = {'1', '5','3'};
    printf("Original String: ");
    printArray(4, val1);
    printf("Add Commas String: ");
    char *temp1 = addCommas(val1);
    printArray(4, temp1);
    free(temp1);

    printf("\n");

    char val2[5] = {'1', '5','3', '2'};
    printf("Original String: ");
    printArray(5, val2);
    printf("Add Commas String: ");
    char *temp2 = addCommas(val2);
    printArray(6, temp2);
    free(temp2);

}