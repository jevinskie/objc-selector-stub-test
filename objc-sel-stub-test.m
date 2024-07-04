#undef NDEBUG
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#import <Foundation/Foundation.h>

NSObject *g_obj_a = NULL;
NSObject *g_obj_b = NULL;
int g_bar_off;
BOOL g_eq;

__attribute__((noinline)) int bar(int a, int b) {
    int res = a * b + g_bar_off;
#ifdef INNER_PRINT
    printf("bar(a = %d, b = %d) => %d\n", a, b, res);
#endif
    return res;
}

__attribute__((noinline)) int foo(int a, int b) {
    int bar_res1 = bar(a, b);
    g_bar_off    = 2;
    g_eq         = [g_obj_a isEqual:g_obj_b];
    // [g_obj_a isEqual:g_obj_b];
    // [NSNumber setVersion:243];
    int bar_res2 = bar(a, b);
    int res      = a + b + bar_res2 + bar_res1;
    // int res = a + b + bar_res2;
#ifdef INNER_PRINT
    printf("foo(a = %d, b = %d) => %d\n", a, b, res);
    printf("isEqual: %s\n", eq ? "YES" : "NO");
#endif
    return res;
}

__attribute__((noinline)) int eql(void) {
    return [g_obj_a isEqual:g_obj_b];
}

int main(int argc, const char **argv) {
    assert(argc == 3);
    int a     = atoi(argv[1]);
    int b     = atoi(argv[2]);
    int res1  = foo(a, b);
    g_obj_a   = [NSNumber numberWithInt:a];
    g_obj_a   = [NSNumber numberWithInt:b];
    int res2  = foo(a, b);
    BOOL res3 = eql();
    return res1 * 1000000 * res2 * 1000 + 10 * g_eq + res3;
}
