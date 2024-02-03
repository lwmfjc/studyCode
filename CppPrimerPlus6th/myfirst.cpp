#include <iostream>
struct free_throws
{
 int i;
 int j;
};
const free_throws & clone(free_throws & ft);
int main()
{
  using namespace std;
  free_throws ft={3,5};
  //clone(ft);
  const free_throws & jolly=clone(ft);
  jolly.i=1;
  cout << jolly.i << "," << jolly.j;
  return 0;
}
const free_throws & clone(free_throws & ft)
{
  free_throws * pt=new free_throws;
  *pt = ft;
  return *pt;
}
