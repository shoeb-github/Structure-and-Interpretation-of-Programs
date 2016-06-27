(define (equ? n1 n2) (apply-generic 'equ? n1 n2))

;;scheme-number package

  ;internal procedure
  (define (equ? n1 n2) (= n1 n2))

  ;;interface
  (put 'equ? '(scheme-number scheme-number) equ?)

;;rational-number package

  ;internal procedure
  (define (equ? r1 r2) (= (* (numer r1) (denom r2)) (* (numer r2) (denom r1))))

  ;interface
  (put 'equ? '(rational rational) equ?)

;;complex-number package

  ;internal procedure
  (define (equ? z1 z2) (and (= (real-part z1) (real-part z2))
			    (= (imag-part z1) (imag-part z2))))

  ;interface
  (put 'equ? '(complex complex) equ?)

