(define (zero? n) (apply-generic 'zero? n))

;;scheme-number package

  ;internal procedure
  (define (zero? n) (= n 0))

  ;;interface
  (put 'zero? '(scheme-number) zero?)

;;rational-number package

  ;internal procedure
  (define (zero? r) (= 0 (numer r)))

  ;interface
  (put 'zero? '(rational) zero?)

;;complex-number package

  ;internal procedure
  (define (zero? z) (and (= 0 (real-part z))
			 (= 0 (imag-part z))))

  ;interface
  (put 'zero? '(complex) zero?)

