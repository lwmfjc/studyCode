#include <unistd.c>
#include <stdio.h>
#include <stdlib.h>
#include <err.h>
static void child()
{
	printf("I'm child! my pid is %d.\n",getpid());
	exit(EXIT_SUCCESS);
}
static void parent(pid_t pid_c)
{
	printf("I'm parent!my pid is %d and the pid of my child is %d.\n",getpid(),pid_c);
	exit(EXIT_SUCCESS);
}
int main(void)
{
	
}
