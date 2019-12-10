# Notes concerning the primality test

The __C code__ from which I adapted the primality test can be found here : rosettacode.org/wiki/Primality_by_trial_division#C.

    int is_prime(unsigned int n) {
  
        unsigned int p;

        if (!(n & 1) || n < 2 ) return n == 2;

        /* comparing p*p <= n can overflow */
        for (p = 3; p <= n/p; p += 2)
            if (!(n % p)) return 0;

        return 1;
    
    }

The program is particulary inefficient and long when N increases. Performances are really bad for
non-prime numbers, as shown in the following diagrams. The main reason seems to be the slowness
of the modulo function I used.

![Primes numbers](/assets/N_instructions_primes.png)

![Non-primes numbers](/assets/N_instructions_not_primes.png)
