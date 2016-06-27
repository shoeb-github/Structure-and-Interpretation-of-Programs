(define (smooth s)
  (stream-map (lambda (x y) (/ (+ x y) 2)) s (cons-stream 0 s)))


(define (make-zero-crossings input-stream last-value)
  (let ((smoothed-input-stream (smooth input-stream)))
    (stream-map sign-change-detector smoothed-input-stream (cons-stream last-value
									smoothed-input-stream))))
