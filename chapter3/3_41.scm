No need for serialized access to balance because it is read-only.
The total money is always conserved once withdraw and deposit are serialized.
