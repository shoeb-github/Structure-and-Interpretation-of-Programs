(define (count-pairs x)
  (let ((S (make-empty-set)))
    (define (count-pairs-internal x)
      (cond ((not (pair? x)) 0)
	    ((element-of-set? x S) 0)
	    (else (set! S (adjoin-set x S))
		  (+ 1 (count-pairs-internal (car x)) (count-pairs-internal (cdr x))))))
    (count-pairs-internal x)))



