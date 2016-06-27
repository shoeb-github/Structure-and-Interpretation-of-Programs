(define (make-monitored f)
  (let ((count-calls 0))
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) count-calls)
	    ((eq? x 'reset-count) (set! count-cals 0))
	    (else (begin (set! count-calls (+ 1 count-calls))
			 (f x)))))))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)


