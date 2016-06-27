(define (averager a b c)
  (let ((u (make-connector))
	(v (make-connector)))
    (constant 2 u)
    (multiplier u c v)
    (adder a b v)
    'ok))

    