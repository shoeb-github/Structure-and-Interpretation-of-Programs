(define (make-accumulator sum)
  (lambda (n)
    (begin (set! sum (+ n sum))
	   sum)))
(define A (make-accumulator 5))

(A 10)

(A 10)


