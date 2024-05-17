#include <stdio.h>

/*
 * pointerTests.c as edited by Corey Young & Caleb Krauter.
 * The main issue with the original file was that it attempted to change the addresses of the
 * pointers with other addresses instead of swapping the values the pointers referenced.
 */

int main(void)
{

	// Swaps the values in num1 and num2 without their involvement!
	double num1 = 16, num2 = 9;
	printf("The un-swapped values are: \n\tnum1: %.1f and num2: %.1f\n", num1, num2);

	double *ptr1, *ptr2;
	ptr1 = &num1;           //pointers need to point at the addresses
	ptr2 = &num2;           //of the variables they're referencing.

	double temp = *ptr1;    //temp has to be the value at ptr1, not the address of ptr1
	*ptr1 = *ptr2;          //The values ptr1 and ptr2 reference have to be swapped,
	*ptr2 = temp;           //that is values need to change, not addresses.

	printf("The swapped values are: \n\tnum1: %.1f and num2: %.1f\n", num1, num2);

	return 0;
}

/*
 * -------ORIGINAL FILE BELOW-------
 * #include <stdio.h>
 *
 * int main(void)
 * {
 * 
 * 	// Swaps the values in num1 and num2 without their involvement!
 * 	double num1 = 16, num2 = 9;
 * 	printf("The un-swapped values are: \n\tnum1: %.1f and num2: %.1f\n", num1, num2);
 * 
 *	double *ptr1, *ptr2;
 * 
 * 	ptr1 = num1;
 * 	ptr2 = num2;
 * 
 * 	double temp = &ptr1;
 * 	&ptr1 = &ptr2;
 * 	&ptr2 = temp;
 * 
 * 	printf("The swapped values are: \n\tnum1: %.1f and num2: %.1f\n", num1, num2);
 * 
 * 	return 0;
 * }
 *
 */
