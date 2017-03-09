class reverse {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        System.out.printf("%d -> %d\n", n, reverse(n));
    }
    static int reverse(int n) {
        int m = 0;
        int i = digit(n) - 1;
        for(; i >= 0; i--) {
            m += (n % 10) * Math.pow(10, i);
            n /= 10;
        }
        return m;
    }
    static int digit(int n) {
        return (int) Math.ceil(Math.log10(n));
    }
}
