#include <stdio.h>
void f();

int main(){
	f();
	f();
	return 0;
}

void f(){
	static int a=0;
	printf("%d\n",a++);
}
