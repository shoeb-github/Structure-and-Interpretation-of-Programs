;;polynomial arithmetic package
(define (negate p)
  (make-poly (variable p)
	     (negate-term-list (term-list p))))

(put 'negate '(polynomial) 
     (lambda (p) (tag (negate p))))

(define (negate-term-list L)
  (if (empty-termlist? L)
      (the-empty-termlist)
      (adjoin-term (negate-term (first-term L))
		   (negate-term-list (rest-terms L)))))

(define (negate-term t)
  (make-term (order t)
	     (negate (coeff t))))


(define (sub-poly p1 p2)
  (add-poly p1 (negate p2)))

(put 'sub '(polynomial polynomial) 
     (lambda (p1 p2) (tag (sub-poly p1 p2))))




