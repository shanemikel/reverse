//usr/bin/env make -s "${0%.c}" && ./"${0%.c}" "$@"; s=$?; rm ./"${0%.c}"; exit $s

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int digits(int n) {
    return ceil(log10(n));
}

int reverse(int n) {
    int m = 0;
    for(int i = digits(n) - 1; i >= 0; i--) {
        div_t d = div(n, 10);
        n = d.quot;
        m += d.rem * pow(10, i);
    }
    return m;
}

int main(int argc, char *argv[]) {
    int n = atoi(argv[1]);
    printf("%d -> %d\n", n, reverse(n));
}
