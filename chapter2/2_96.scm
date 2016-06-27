;;a
(define (pseudoremainder-terms a b)
  (let ((o1 (order (first-term a)))
	(o2 (order (first-term b))))
    (let ((integerizing-factor-order (add 1 (sub o1 o2)))
	  (integerizing-factor-coeff (coeff (first-term b))))
      (cadr (div-terms (mul-term-by-all-terms (make-term 0 
							 (exp integerizing-factor-coeff integerizing-factor-order)
					      a)
		       b)))))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))

(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
		 (gcd-terms (term-list p1) (term-list p2)))
      (error "not same variables -- GCD-POLY" (list p1 p2))))

(define (gcd-number a b)
  (if (=zero? b 0)
       a
       (gcd b (remainder a b))))

(put 'greatest-common-divisor '(polynomial polynomial)
     (lambda (p1 p2) (tag (gcd-poly p1 p2))))

(put 'greatest-common-divisor '(scheme-number scheme-number)
     (lambda (a b) (tag (gcd-number a b))))



;;b
(define (gcd-terms a b)
  (if (empty-termlist? b)
      (reduce a)
      (gcd-terms b (pseudoremainder-terms a b))))

(define (reduce-termlist a)
  (let ((gcd-coeff (gcd-coeff-list (map coeff a))))
    (car (div-terms a
		    (adjoin-term (make-term 0 gcd-coeff) (the-empty-termlist)))))))

(define (gcd-coeff-list a)
  (if (= (length a) 2)
      (gcd (map coeff a))
      (min (gcd (map coeff (list (car a) (cadr a))))
	   (gcd-coeff-list (cddr a)))))





