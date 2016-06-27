(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (* x x x))))

possible values for x are:
10^2
10^3
10^4
10^5
10^6





(define x 10)
(define s (make-serializer))

(parallel-execute (s (lambda () (set! x (* x x))))
		  (s (lambda () (set! x (* x x x)))))

possible values for x are:
10^6.


