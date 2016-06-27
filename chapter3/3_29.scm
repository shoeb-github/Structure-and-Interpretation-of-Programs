(define (or-gate o1 o2 output)
  (let ((i1 (make-wire))
	(i2 (make-wire))
	(a1 (make-wire)))
    (inverter o1 i1)
    (inverter o2 i2)
    (and-gate i1 i2 a1)
    (inverter a1 output)
    'ok))


or-gate-delay = 2*(inverter-delay) + and-gate-delay
