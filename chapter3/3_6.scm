(define (rand m)
  (let ((x random-init))
    (cond ((eq? m 'generate) (begin (set! x (rand-update x))
				    x))
	  ((eq? m 'reset) (lambda (new-value)
			    (set! x new-value)))
	  (else "wrong command -- RAND" (list m)))))
