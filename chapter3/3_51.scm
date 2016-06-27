(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval a b)
  (if (> a b)
      the-empty-stream
      (cons-stream
       a
       (stream-enumerate-interval (+ a 1) b))))


(define the-empty-stream '())

(define (show x)
  (display-line x)
x)


(define x (stream-map show (stream-enumerate-interval 0 10)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(stream-ref x 5)


(stream-ref x 7)


