; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is
; using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))
(define (test x y)
(if (= x 0)
0
y))

;Then he evaluates the expression

(test 0 (p))

;What behavior will Ben observe with an interpreter that uses 
;applicative-order evaluation? What behavior
;will he observe with an interpreter that uses normal-order 
;evaluation? Explain your answer. (Assume that
;the evaluation rule for the special form if is 
;the same whether the interpreter is using normal or
;applicative order: The predicate expression is 
;evaluated first, and the result determines whether to evaluate
;the consequent or the alternative expression.)

; Answer # 1: With applicative order evaluation, the interpreter
; would evaluate from left to right, inner most first, then outer.
; Therefore, the result of the call to (test 0 (p)) would result in
; an infinite loop, as the call th (p) would eventuall result.

; On the other hand, a normal order evaluating interpreter would
; have it so that (test 0 (p)) would never enter the infinite
; loop, as (p) would not get called in the test, since (= 0 x) is
; true, and thus since it is lazy evaluated, (p) would not cause the
; infinite loop.