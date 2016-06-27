(defin (reduce-terms n d)
  (let ((gcd (gcd-terms n d))
	(o1 (max (order (first-term n)) (order (first-term d)))))
    (let ((o2 (order (first-term gcd))))
      (
;;simple just need to follow each step of exercise as a 'let binding'



(define (reduce-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (map (lambda (L) (make-poly (variable p1) L))
	   (reduce-terms (term-list p1) (term-list p2)))
      (error "not same variable -- REDUCE-POLY" (list p1 p2))))

;;b
