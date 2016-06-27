To fix the bug you need last value of the average-stream and last value of the original
input stream.

(define (make-zero-crossings input-stream last-value-of-input-stream last-value-of-avgpt)
  (let ((avgpt (/ (+ (stream-car input-stream) last-value-of-input-stream) 2)))
    (cons-stream (sign-change-detector avgpt last-value-of-avgpt)
		 (make-zero-crossings (stream-cdr input-stream)
				      (stream-car input-stream)
				      avgpt))))
