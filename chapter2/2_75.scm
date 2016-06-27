(define (make-from-mag-ang r p)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* r (cos p)))
	  ((eq? op 'imag-part) (* r (sin p)))
	  ((eq? op 'magnitude) r)
	  ((eq? op 'angle) p)
	  (else
	   (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))
