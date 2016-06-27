;complex number

(define (project z)
  (make-real (real-part z)))
(put 'project 'complex project)

;real number
(define (project x)
  (make-rational (round x) 1))
(put 'project 'real project)


;rational number
(define (project rat)
 (make-integer (round (make-real (/ (numer rat) (denom rat))))))
(put 'project 'rational project)

;integer number
(define (project z)
  z)
(put 'project 'integer project)

(define (project n) (apply-generic 'project n))


(define (drop n)
  (if (equ? (raise (project n) n))
      (drop (project n))
      n))

  (define (apply-generic op . args)
   (let ((type-tags (map type-tag args)))
     (let ((proc (get op type-tags)))
       (if proc
	   (drop (apply proc (map contents args)))
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








