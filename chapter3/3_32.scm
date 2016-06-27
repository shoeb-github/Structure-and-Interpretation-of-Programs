If two or input-events trigger an output-event simultaneously; we stop the clock.
And do following,
change the output-event for input-event1
change the output-event for input-event2 (note that this new output-event is calculated with new input-event1).
....and so on.
This has to be done in FIFO order. Otherwise, affecting change for input-event2 will not be correct because
output-event would then not reflect the changed input-event1.
