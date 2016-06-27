If test-and-set! is not atomic, two processes P1 and P2 can both acquire the mutex
because P2 can read the mutex to be false before P1 has set it to true.
