(define (estimate-integral P x1 x2 y1 y2)
  (define experiment-stream
    (stream-map P (random-in-range-stream x1 x2) (random-in-range-stream y1 y2)))
  (stream-map (lambda (p) (* p (* (abs (- x1 x2)) (abs (- y1 y2)))))
	      (monte-carlo experiment-stream 0 0)))

(define (random-in-range-stream low high)
  (cons-stream (radom-in-range low high)
	       (random-in-range-stream low high)))

  
  