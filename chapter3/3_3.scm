(define (make-account balance password)

  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (let ((access-counter 0))
    (define (dispatch p m)
      (cond ((eq? p password) (begin (set! access-counter 0)
				     (cond ((eq? m 'withdraw) withdraw)
					   ((eq? m 'deposit) deposit)
					   (else (error "Unknown request -- MAKE-ACCOUNT" m)))))
	    ((> access-counter 6) call-the-cops)
	    (else (begin (set! access-counter (+ 1 access-counter))
			 (error "Incorrect password"))))))

  dispatch)
