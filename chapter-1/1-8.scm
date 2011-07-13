(define (good-enough? guess x)
  (if (< (abs (- (* guess guess) x)) 0.001)
      #t
      #f))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2.0 guess)) 3.0))

(define (cube-root guess x)
  (if (good-enough? guess x)
      guess
      (cube-root (improve guess x) x))
  )