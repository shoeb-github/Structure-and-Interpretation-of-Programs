(define (squarer a b)
  (multiplier a a b))


Consider (set-value! b value 'user)

The multiplier constraint will try to set connector 'a'
using (/ (get-value b) (get-value b)) which is undefined.
