(define (=zero? p)
  (define (zero-terms? terms)
    (or (empty-termlist? terms)
	(and (=zero? (coeff (first-term terms)))
	     (zero-terms? (rest-terms terms)))))
  (zero-terms? (term-list p)))


(put 'zero? '(polynomial) =zero?)