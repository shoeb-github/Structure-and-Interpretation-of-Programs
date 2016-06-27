(define (serialized-exchange a1 a2)
  (let ((a1_num (a1 'account_number))
	(a2_num (a2 'account_number))
	(serializer1 (a1 'serializer))
	(serializer2 (a2 'serializer)))
    (if (< a1_num a2_num)
	( (serializer2 (serializer1 exchange-account))
	  a1
	  a2)
	( (serializer1 (serializer2 exchange-account))
	  a1
	  a2))))

It is clear there will be no deadlock since each process cannot request state
with lower number after it acquired a higher state.


