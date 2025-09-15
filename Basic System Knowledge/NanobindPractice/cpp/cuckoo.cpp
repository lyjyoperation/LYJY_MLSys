#include <nanobind/nanobind.h>

int add(int a, int b) { return a + b; }

// 注意这里的名字要和cmake中nanobind_add_module的名字相同
NB_MODULE(cuckoo, m) { m.def("add", &add); }