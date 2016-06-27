(define fibs 
  (cons-stream 0
	       (cons-tream 1
			   (add-streams (stream-cdr fibs)
					fibs))))


it works iteratively, taking about nth fibonacci number takes about
'n' additions.


if (delay <exp>) is implemented as (lambda () <exp>) then additions are exponential
because every call to stream-cdr is evaluated anew.
