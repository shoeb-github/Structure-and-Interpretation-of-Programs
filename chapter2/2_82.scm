(define (apply-generic op . args)
  (let ((type-tags (map tag-type args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (pair? args)
	      (try-coercion-choose args op args)
	      (error "no operation for these types"
		     (list op type-tags)))))))

(define (try-coercion-choose choices op args)
  (if (null? choices) 
      (error "no operation for these types --- " (list op (map type-tag args)))
      (let ((type-tags (map type-tag args))
	    (choice-tag (type-tag (car choices))))
	(if (coerce-ok? choice-tag type-tags)
	    (let ((proc (get op (coerce-this choice-tag type-tags))))
	      (if proc
		  (apply proc (contents (map (lambda (t2) ((get-coercion t2 t1) t2)) (map contents args))))
		  (error "no operation for these types -- " (list op type-tags))))
	    (try-coercion-choose (cdr choice) op args)))))

(define (coerce-this choice-tag type-tags)
  (map (lambda (type-tag) (choice-tag)) type-tags))

(define (coerce-ok? choice-tag type-tags)
  (cond ((null? type-tags) true)
	((equal? choice-tag (car type-tags)) (coerce-ok? choice-tag (cdr type-tags)))
	(else (and
	       (get-coercion (car type-tags) choice-tag)
	       (coerce-ok? choice-tag (cdr type-tags))))))










