#include "csapp.h"
void *thread(void *vargp);                    //line:conc:hello:prototype
void *thread1(void *vargp);

int main()                                    //line:conc:hello:main
{
    pthread_t tid;                            //line:conc:hello:tid
	pthread_t tid1;
    //Pthread_create(&tid, NULL, thread, NULL); //line:conc:hello:create
	pthread_create(&tid1,NULL,thread,NULL);
	pthread_create(&tid1,NULL,thread,NULL);
	pthread_create(&tid1,NULL,thread,NULL);

	//Pthread_join(tid, NULL);                  //line:conc:hello:join
	printf("%s\n","hello-main");
	sleep(10);
    //exit(0);                                  //line:conc:hello:exit
}

static void my_init(void){
 printf("hello,my_init\n");
}

void *thread(void *vargp) /* thread routine */  //line:conc:hello:beginthread
{
    
    printf("Hello, world!-thread\n");                 
	static pthread_once_t once=PTHREAD_ONCE_INIT;
	Pthread_once(&once,my_init);
	//while(1){

	//}
    return NULL;                               //line:conc:hello:return
}   //line:conc:hello:endthread

void *thread1(void *vargp){
	printf("hello,world!-thread1\n");
	while(1){
		printf("thread1\n");
	}
}
