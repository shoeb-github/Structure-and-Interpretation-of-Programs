(define (make-table)
  (let ((local-table (list '*table*)))

    (define (look-up keylist)
      (define (look-up-table keylist table)
	(cond ((null? keylist) false)
	      ((last-pair? keylist)
	       (let ((record (assoc (car keylist) (cdr table))))
		 (if record
		     (cdr record)
		     false)))
	      (else (let ((subtable (assoc (car keylist) (cdr table))))
		      (if subtable
			  (look-up-table (cdr keylist) subtable)
			  false)))))
      (look-up-table keylist local-table))

    (define (insert! keylist value)
      (define (insert-table! keylist table)
	(cond ((null? keylist) (error "insert called with no keys -- TABLE"))
	      ((last-pair? keylist)
	       (let ((record (assoc (car keylist) (cdr table))))
		 (if record
		     (set-cdr! record value)
		     (set-cdr! table (cons (cons (car keylist) value)
					   (cdr table))))))
	      (else (let ((subtable (assoc (car keylist) (cdr table))))
		      (if subtable
			  (insert-table! (cdr keylist) subtable)
			  (begin (set-cdr! table
					   (cons (list (car keylist))
						 (cdr table)))
				 (insert-table! (cdr keylist) (cadr table))))))))
      (insert-table! keylist local-table))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))

    dispatch))

      

    
 