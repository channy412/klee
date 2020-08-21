#include <assert.h>
#include "klee/klee.h"


int assert_tester(int i) {
  if(i == 3)
    assert(0);
  return 0;
}


int main() {
  int a;
  klee_make_symbolic(&a, sizeof(a), "a");
  return assert_tester(a);
}
