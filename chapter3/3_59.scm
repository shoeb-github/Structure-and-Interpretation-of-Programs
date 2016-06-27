(define ones (cons-stream 1 ones))

(define integers (cons-stream 1
			      (add-streams ones integers)))
(define div /)
(define (divide-streams s1 s2)
  (stream-map div s1 s2))

(define (integrate-series s)
  (divide-streams s integers))

(define sine-series
  (cons-stream 0
	       (integrate-series cosine-series)))

(define cosine-series
  (cons-stream 1
	       (integrate-series 
		(scale-stream sine-series -1))))



