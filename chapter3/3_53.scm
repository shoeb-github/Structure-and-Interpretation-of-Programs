(define s (cons-stream 1 (add-streams s s)))

same as

(define s (con-stream 1 (scale-stream double s)))
