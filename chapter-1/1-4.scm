;Observe that our model of evaluation allows for combinations whose operators are
;compound expressions. Use this observation to describe the behavior of the following procedure:


(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; Answer: Because functions are treated as data (first order), + and - are functions
; which are returned depending on what b is (great than 0 or not).  This returned
; function is then applied to a b arguments.
