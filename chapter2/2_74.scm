(define (get-record employee file)
  ((get 'get-record file) employee))


(define (get-salary record)
  (apply-generic 'get-salary record))

(define (find-employee-record employee files)
  (cond ((null? files) false)
	((employee? employee (car files)) (get-record employee file))
	(else (find-employee-record employee (cdr files)))))

(define (employee? employee file)
  ((get 'employee? file) employee))







