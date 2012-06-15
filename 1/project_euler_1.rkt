#lang racket

(define (answer [n 0] [m 1000])
  (if (equal? n m) 
      0
      (+ 
       (if 
        (or (equal? (remainder n 5) 0) 
            (equal? (remainder n 3) 0)) n 0) 
       (answer (+ n 1))
       )
      )
  )

(answer)
