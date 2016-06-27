  (define (apply-generic op . args)
   (let ((type-tags (map type-tag args)))
     (let ((proc (get op type-tags)))
       (if proc
	   (apply proc (map contents args))
	   (if (= (length args) 2)
	       (let ((a1 (car args))
		     (a2 (cadr args)))
		 (let ((superarg (super-arg a1 a2))
		       (subarg (sub-arg a1 a2)))
		   (let((sub->super (get-coercion-by-raise subarg superarg)))
		     (if sub->super
			 (apply-generic op (sub->super subarg) superarg)
			 (else
			  (error "No method for these types"
				 (list op type-tags)))))))
	       (error "No method for these types"
		      (list op type-tags)))))))

(define (get-coercion-by-raise subarg superarg)
  (let ((supertype (type-tag superarg))
	(subtype (type-tag subtype)))
    (if (eq? subtype supertype)
	(lambda (a) a)
	(let ((proc (get 'raise subarg)))
	  (if proc
	      (lambda (a)
		((get-coercion-by-raise (proc subarg) superarg) (proc a)))
	      (error "No raise possible for these types" subarg superarg))))))
(define (super-arg a1 a2)
  (if (get-coercion-by-raise a1 a2)
      a2
      a1))

(define (sub-arg a1 a2)
  (if (get-coercion-by-rasie a1 a2)
      a1
      a2))








