(define (make-mutex-list n)
  (if (= n 0)
      '()
      (append (list (make-mutex)) (make-mutex-list (- n 1)))))

(define (make-semaphore n)
  (let ((available-mutex-list (make-mutex-list n))
	(acquired-mutex-list '()))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (null? available-mutex-list)
		 (the-semaphore 'acquire)
		 (begin ((car available-mutex-list) 'acquire)
			(set! acquired-mutex-list (append (list (car available-mutex-list)) acquired-mutex-list))
			(set! available-mutex-list (cdr available-mutex-list)))))

	    ((eq? m 'release)
	     (if (not (null? acquired-mutex-list))
		 (begin (set! available-mutex-list (append (list (car acquired-mutex-list)) available-mutex-list))
			(set! acquired-mutex-list (cdr acquired-mutex-list))
			((car available-mutex-list) 'release))))))
    the-semaphore))


In terms of atomic test-and-set! it is similar except that the 
'acquire message to mutex is replaced by test-and-set! call.
'release message to mutex is replace with (clear! cell)

----------------------------
The implementation below is better. Above implementation requires that set! operations in acquire and release
are atomic.

(define (make-semaphore n)
  (let ((lock (make-mutex))
	(taken 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (lock 'acquire)
	     (if (< taken n)
		 (begin (set! taken (+ 1 taken)) (lock 'release))
		 (begin (lock 'releaase) (the-semaphore 'acquire))))
	    ((eq? m 'release)
	     (lock 'acquire)
	     (if (> taken 0)
		 (set! taken (- taken 1)))
	     (lock 'release))))
    the-semaphore))


(define (make-semaphore n)
  (let ((cell (list false))
	(taken 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (test-and-set! cell)
		 (the-semaphore 'acquire))
	     (if (< taken n)
		 (begin (set! taken (+ 1 taken)) (clear! cell))
		 (begin (clear! cell) (the-semaphore 'acquire))))
	    ((eq? m 'release)
	     (if (test-and-set! cell)
		 (the-semaphore 'acquire))
	     (if (> taken 0)
		 (set! taken (- taken 1)))
	     (clear! cell))))
    the-semaphore))







