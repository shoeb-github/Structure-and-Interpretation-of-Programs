(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (region-test)
    (let ((x (random-in-range x1 x2))
	  (y (random-in-range y1 y2)))
      (P x y)))

  (* (* (abs (- x1 x2)) (abs (- y1 y2)))
     (monte-carlo trials region-test)))









