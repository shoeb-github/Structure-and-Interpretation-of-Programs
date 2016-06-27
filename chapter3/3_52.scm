(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)


(define seq (stream-map accum (stream-enumerate-interval 1 20)))


(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred
				     (stream-cdr stream))))
	(else
	 (stream-filter pred (stream-cdr stream)))))


(define y (stream-filter even? seq))

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
			 seq))

(stream-ref y 7)

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(display-stream z)

yes, for un-memoized 'delay' it would have been different for "(display-stream z)" because the
delayed expressions are type call-by-name thunks.


