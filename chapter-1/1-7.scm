(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))



(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


; (Normally, these wouldn't work, but DrScheme has support for
; arbitrarily large and small numbers).
; This would show that the tolorance test fails for very large numbers:
;(sqrt-iter 2232323200234.0 23232342323232323232323223234.0)

; This would show that the tolorance test fails for small large numbers:
;(sqrt-iter 0.000000002000000000000000000000090000000000000000000232323200234 0.0000000000002323234232323234)

(define g-frac 0.01)

(define (my-good-enough? cur-guess next-guess)
  (if (< (/ (abs (- cur-guess next-guess)) (if (<= cur-guess next-guess) next-guess cur-guess)) g-frac)
      #t
      #f)
  )

(define (my-sqrt-iter guess x)
  (if (my-good-enough? guess (/ (+ guess (/ x guess)) 2.0))
      guess
      (my-sqrt-iter (improve guess x)
                 x)))