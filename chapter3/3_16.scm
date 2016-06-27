(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))


it is not correct when the language allows assignment/change for a data object.

to get length 3

'(a b c)


to get length 4

both car and cdr of first pair point to the same second pair.
second pair car points to third pair. cdr to some symbol.
third pair car and cdr point to some symbols.


to get length 7
both car and cdr of first pair point to the same second pair.
likewise car and cdr of second pair point to th same third pair.
and third pair car and cdr point to some symbols.


to never return
introduce a cycle in the list structure.
