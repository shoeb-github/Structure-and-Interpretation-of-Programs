(define (merge-weighted s1 s2 w)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else 
	 (cond ( (< (w (car-stream s1)) (w (car-stream s2))) (cons-stream (car-stream s1) 
								   (merge-weighted (cdr-stream s1) s2)))
	       ( (> (w (car-stream s1)) (w (car-stream s2))) (cons-stream (car-stream s2)
								   (merge-weighted s1 (cdr-stream s2))))
	       ( else (cons-stream (car-stream s1)
				   (merge-weighted (cdr-stream s1) s2)))))))


(define (weighted-pairs s t w)
  (cons-stream (list (car-sream s) (car-stream t))
	       (merge-weighted 
		(stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
		(weighted-pairs (stream-cdr s) (stream-cdr t) w)
		w)))


(define weighted-integer-pairs (weighted-pairs integers integers (lambda (p) (+ (car p) (cadr p)))))

(define weighted-hamming-pairs (weighted-pairs hamming-stream hamming-stream 
					       (lambda (p) (+ (* 2 (car p))
							      (+ (* 3 (cadr p))
								 (* 5 (car p) (cadr p)))))))




