serialized-exchange has serialized by both account1 and account2.
Thus, when it is executed the calls
((account1 'withdraw) difference)
((account2 'deposit) difference)

cannot be executed since the former is serialized by account1
and the latter is serialized by account2.
