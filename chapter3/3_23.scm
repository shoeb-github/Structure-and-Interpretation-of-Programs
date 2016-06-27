(define (make-deque) (cons (make-queue) (make-queue)))

(define (front-queue-ptr deque) (car deque))
(define (rear-queue-ptr deque) (cdr deque))

(define (empty-deque? deque)
  (or (empty-queue? (front-queue-ptr deque))
       (empty-queue? (rear-queue-ptr deque))))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with a empty deque" deque)
      (car (front-ptr (front-queue-ptr deque)))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with a empty deque" deque)
      (car (front-ptr (rear-queue-ptr deque)))))

(define (front-insert-deque! deque item)
  (cond ((empty-deque? deque)
	 (insert-queue (front-queue-ptr deque) item)
	 (insert-queue (rear-queue-ptr deque) item)
	 deque)
	(else
	 (insert-queue! (rear-queue-ptr deque) item)
	 (set-front-ptr! (front-ptr (front-queue-ptr deque))
			 (rear-ptr (rear-queue-ptr deque))))
	 deque))

(define (rear-insert-deque! deque item)
  (cond ((empty-deque? deque)
	 (insert-queue (front-queue-ptr deque) item)
	 (insert-queue (rear-queue-ptr deque) item)
	 deque)
	(else
	 (insert-queue! (front-queue-ptr deque) item)
	 (set-front-ptr! (front-ptr (rear-queue-ptr deque))
			 (rear-ptr (front-queue-ptr deque))))
	 deque))

(define (front-delete-deque deque)
  (cond ((empty-deque? deque)
	 (error "FRONT-DELETE! called with a empty deque" deque))
	((eq? (front-ptr deque) (rear-ptr deque))
	 (set-front-ptr! deque '())
	 (set-rear-ptr! deque '())
	 deque)
	(else
	 (delete-queue! (front-queue-ptr deque))
	 (set-rear-ptr! (rear-ptr (rear-queue-ptr deque))
			(front-ptr (front-queue-ptr deque)))
	 deque)))


(define (rear-delete-deque deque)
  (cond ((empty-deque? deque)
	 (error "REAR-DELETE! called with a empty deque" deque))
	((eq? (front-ptr deque) (rear-ptr deque))
	 (set-front-ptr! deque '())
	 (set-rear-ptr! deque '())
	 deque)
	(else
	 (delete-queue! (rear-queue-ptr deque))
	 (set-rear-ptr! (rear-ptr (front-queue-ptr deque))
			(front-ptr (rear-queue-ptr deque)))
	 deque)))

(define (print-deque deque)
  (print-queue (front-queue-ptr deque)))
