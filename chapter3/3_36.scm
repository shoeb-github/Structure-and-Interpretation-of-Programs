(define a (make-connector))

(define b (make-connector))

(set-value! a 10 'user)


(for-each-except) is evaluated whose enclosing environment is the global environment.
And the bindings for setter, inform-about-value and constraints are evaluated from the 
environment created by (make-connector) for connector 'a'.
