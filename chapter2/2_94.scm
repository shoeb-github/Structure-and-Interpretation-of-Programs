(define (remainder-terms a b)
  (cadr (div-terms a b)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

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


