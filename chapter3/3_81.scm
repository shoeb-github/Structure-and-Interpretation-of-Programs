(define (rand message-stream)
  (define (make-random-generator initial)
    (define random-generator (cons-stream initial
					  (stream-map rand-update random-generator)))
    random-generator)
  (stream-map stream-car
	      (stream-map (lambda (m r)
			    (cond ((eq? m 'generate) (make-radom-generator r))
				  ((eq? m 'reset) (make-random-generator random-initial))
				  (else (error "wrong command - RAND" (list m)))))
			  message-stream
			  (make-random-generator random-initial))))




Another solution

(define (rand message-stream)
  (define random-generator (cons-stream random-initial
					(stream-map (lambda (m r)
						      (cond ((eq? m 'generate) (rand-update r))
							    ((eq? m 'reset) random-initial)
							    (else (error "wrong command - RAND" (list m)))))
						    message-stream
						    random-generator)))
  random-generator)

