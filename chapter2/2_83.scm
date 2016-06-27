;raise for integer
(define (raise int)
  (make-rational int 1))

(put 'raise '(integer) raise)

;raise for rational
(define (raise rat)
  (make-real (/ (numer rat) (denom rat))))

(put 'raise '(rational) raise)

;raise for real
(define (raise re)
  (make-from-real-imag re 0))

(put 'raise '(real) raise)


;generic raise procedure
(define (raise x)
  (apply-generic 'raise x))


