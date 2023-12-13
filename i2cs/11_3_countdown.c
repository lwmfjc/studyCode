/*
 *
 Program Name : countdown,our first C program
 *
 * Descriptions: This ....

 */

/* The next ...*/
#include <stdio.h>
#define STOP 0
/* Function : main
/* Description: ...*/
int main(){
	/*Variable de...*/
	int counter;
	int startPoint;

	/*.....*/
	printf("===== Countdown Program ====\n");
	printf("Enter a positive interger: ");
	scanf("%d",&startPoint);

	/* Count down ...*/
	for (counter = startPoint; counter >= STOP;counter --)
		printf("%d\n",counter);
}


