(define (first-term term-list)
  (if (null? term-list)
      (make-term 0 0)
      (make-term (length term-list) (car term-list))))

(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
      term-list
      (cons (coeff term) term-list)))

