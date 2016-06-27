(define (triples s t u)
  (cons-stream (list (stream-car s) (stream-car t) (stream-car u))
	       (interleave
		(stream-map (lambda (x) (list (stream-car s) (stream-car t) x)) (stream-cdr u))
		(interleave
		 (stream-map (lambda (p) (cons (stream-car s) p)) (pairs (stream-cdr t) (stream-cdr u)))
		 (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))))))


(define pythogorean-triples 
  (stream-filter (lambda (triple) (= (+ (square (car triple)) (square (cadr triple)))
			      (square (caddr triple))))
	  (triples integers integers integers)))


(define square (lambda (x) (* x x)))

(define integers (cons-stream 1
			      (add-streams ones integers)))

(define ones (cons-stream 1
			  ones))
