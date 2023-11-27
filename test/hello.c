
//  gcc -fdump-tree-gimple -o output_file hello.c
#include <stdio.h>
int add(int a, int b) {
  int c = a + b;
  return c;
}
int main() {
  printf("hello world");
  int i = add(5, 6);
  return 0;
}