#!/usr/bin/env nix-shell
#! nix-shell -i python3 -p python3

import math
import sys

def digits(n):
    return math.ceil(math.log10(n))

def reverse(n):
    m = 0
    i = digits(n) - 1
    for i in range(i,-1,-1):  # [i,i-1..0]
        (n,r) = divmod(n, 10)
        m += r*10**i
    return m

if __name__ == "__main__":
    n = int(sys.argv[1])
    output = "{} -> {}".format(n, reverse(n))
    print(output)
