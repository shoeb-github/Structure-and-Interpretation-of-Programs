(define (cycle? x)
  (let ((test-pair (make-empty-set)))
    (define (cycle-internal? x)
      (cond ((not (pair? x)) false)
	    ((element-of-set? x visited-pairs) true)
	    (else (set! visited-pairs (adjoin-set x visited-pairs))
		  (cycle-internal? (cdr x)))))
    (cycle-internal? x)))





