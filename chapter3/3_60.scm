(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
	       (add-streams (scale-stream (stream-cdr s2)s2 (stream-car s1)) 
			    (mul-series (stream-cdr s1) s2))))


(define (add-streams s1 s2)
  (stream-map + s1 s2))

(add-streams (mul-series sine-series sine-series)
	     (mul-series cosine-series cosine-series))


