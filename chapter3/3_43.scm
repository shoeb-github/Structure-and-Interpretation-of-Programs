If each exchange is serial then the resulting triple is obviously
a permutation of 10,20,30.


If the exchanges are implemented using the first version of exchange,
Peter could exchange 10 and 30 before Paul completed his exchange of 10 and 20.
This will give balance 40,10,10


Consider a super account with balance 10+20+30
Now all transctions with respect to this super account are 
serialized withdraws or deposits; and each withdrawn amount
has corresponding deposit. Thus, total money is conserved.


a1: 10
a2: 20
a3: 30

If no serialization, whatsoever, following procedures are executed
concurrently

(a1 'withdraw -10)    -> these can set balance for a1 = 20 or 30.
(a1 'withdraw -20)


(a2 'deposit -10)    -> can be done concurrently.
(a3 'deposit -20)

so final balances can be 20,10,10.

