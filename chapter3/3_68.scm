(define (pairs s t)
  (interleave 
   (stream-map (lambda (x) (list (stream-car s) x)) t)
   (pairs (stream-cdr s) (stream-cdr t))))


This will go into infinite recursion.


The correct definition as given in the book works because
cons-stream is a special form whose cdr is a delayed object.

