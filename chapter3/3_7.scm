(define (make-joint acc old-passwd new-passwd)
  (define (withdraw amount)
    ((acc 'old-passwd 'withdraw) amount))
  
  (define (deposit amount)
    ((acc 'old-passwd 'deposit) amount))

  (define (dispatch m passwd)
    (if (eq? passwd new-passwd)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else "wrong message -- MAKE-JOINT" (list m)))
	(error "Incorrect Password"))))


  
    