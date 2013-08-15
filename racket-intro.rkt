#lang racket

(define (get-layer n)
  (let* ([side-length (- (* 2 n) 1)]
         [biggest-number (* side-length side-length)]
         [number-of-numbers (if (equal? biggest-number 1) 
                                1 
                                (- (* 4 side-length) 4))]
         [smallest-number (+ 1 (- biggest-number number-of-numbers))])
    (build-list number-of-numbers (λ (i) (+ smallest-number i)))))

(define (count-diagonal-primes layer)
  (if (equal? layer '(1)) 0
      (let* ([starting-posn (length layer)]
             [decrement-amount (/ starting-posn 4)]
             [selector (λ (n) (first (drop layer (- n 1))))]
             [numbers-to-check (build-list 3 (λ (i) (selector (- starting-posn (* (+ 1 i) decrement-amount)))))])
        numbers-to-check)))

