Copyright (C) 2011 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday November 26, 2013 at 6:35:32 AM
  Release 9.1.1 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116
;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)

(define (attach-tag tag x) (cons tag x))
;Value: attach-tag

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))
;Value: type-tag

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))
;Value: contents

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp) var))))
;Value: deriv

(define (operator exp) (car exp))
;Value: operator

(define (operands exp) (cdr exp))
;Value: operands

(define (install-deriv-package)
  ;;internal procedures
  (define (deriv-sum exp v)
    (make-sum (deriv (addend exp) v)
	      (deriv (augend exp) v)))
  (define (deriv-prod exp v)
    (make-sum
     (make-product (multiplier exp) (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var) (multiplicand exp))))

  (define (deriv-exp exp v)
    (make-product
     (make-product (exponent exp)
		   (make-exp (base exp) (- (exponent exp) 1)))
     (deriv (base exp) v)))

  (define (addend exp) (cadr exp))
  (define (augend exp) (caddr exp))

  (define (multiplier exp) (cadr exp))
  (define (multiplicand exp) (caddr exp))

  (define (base exp) (cadr exp))
  (define (exponent exp) (caddr exp))

  (define (make-sum s1 s2) (list '+ s1 s2))
  (define (make-product m1 m2) (list '* m1 m2))
  (define (make-exp b e) (list '** b e))

  ;;interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-prod)
  (put 'deriv '** deriv-exp)
)


