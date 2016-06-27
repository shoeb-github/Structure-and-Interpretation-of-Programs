initial balance is 100
(a)
peter->paul->mary
paul->peter->mary
final balance is 45

peter->mary->paul
final balance is 35

paul->mary->peter
final balance is 50


mary->peter->paul
mary->paul->peter
final blance is 40



(b)
Suppose all three read same initial balance 100.
Then
final balance can be 110  (if Peter sets balance last)
final balance can be 80  (if Paul sets balance last)
final balance can be 50 (if Mary sets balance last) : this is same as paul->mary->peter above.


if Peter sets balance to 110 first. And then, Paul and Mary interleave
final balance can be 90 (if Paul sets balance last)
final balance can be 55 (if Mary setts balance last)

if Paul sets balance to 80 first. And then, Peter and Mary interleave
final balance can be 90 (if Peter sets balance last)
final balance can be 40 (if Mary sets balance last) : this is same as mary->paul->peter, mary->peter->paul above.

if Mary sets balance to 50 first. And then, Peter and Paul interleave.
final balance can be 60 (if Peter sets balance last)
final balance can be 30 (if Paul sets balance last).





