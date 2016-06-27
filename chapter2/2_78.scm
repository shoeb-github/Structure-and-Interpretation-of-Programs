(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
	((pair? datum) (car datum))
	(else (error "bad datum -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((number? datum) datum)
	((pair? datum) (cdr datum))
	(else (error "bad datum -- CONTENTS" datum))))

(define (attach-tag tag datum)
  (cond ((number? datum) datum)
	(else (cons tag datum))))
