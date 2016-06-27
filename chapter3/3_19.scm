 (define (cycle? x)
   (if (null? (cdr x))
       false
       (let ((y (mystery x)))
	 (if (eq? y x) 
	     (begin (mystery y) true)
	     false))))

	     




