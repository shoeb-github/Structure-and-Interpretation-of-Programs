(define (invert-unit-series s)
  (define x (cons-stream 1
			 (scale-series (mul-series (stream-cdr s)
						   x)
				       -1)))
  x)

					 