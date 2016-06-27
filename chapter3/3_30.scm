(define (ripple-carry-adder A B S C)
  (let ((c (make-wire)))
    (if (last-pair? A)
	(set-signal! c 0)
	(ripple-carry-adder (cdr A) (cdr B) (cdr S) c))
    (full-adder (car A) (car B) c (car S) C)
    'ok))


delay for ripple-carry-adder is 

half-adder-delay = 2*and-gate-delay + inverter-delay

full-adder-delay = 2*half-adder-delay + or-gate-delay
                 = 4*and-gate-delay + 2*inverter-delay + or-gate-delay


Thus, ripple-carry-adder-delay = 4N*and-gate-delay + 2N*inverter-delay + N*or-gate-delay



