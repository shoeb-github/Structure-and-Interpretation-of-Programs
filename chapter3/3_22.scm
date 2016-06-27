(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '())
    (define (set-front-ptr item)
      (set! front-ptr item))
    (define (set-rear-ptr item)
      (set! rear-ptr item))
    
    (define (dispatch m)
      (cond ((eq? m 'front-ptr) front-ptr)
	    ((eq? m 'rear-ptr) rear-ptr)
	    ((eq? m 'set-front-ptr!) set-front)
	    ((eq? m 'set-rear-ptr!) set-rear)
	    (else "ERROR - MAKE-QUEUE called with wrong message" m)))
    dispatch)))

(define (set-front-ptr! queue item)
  ((queue 'set-front-ptr!) item))

(define (set-rear-ptr! queue item)
  ((queue 'set-rear-ptr!) item))

(define (front-ptr queue)
  (queue 'front-ptr))

(define (rear-ptr queue)
  (queue 'rear-ptr))


The queue operations below are unchanged
insert
delete
empty-queue?
front-queue

