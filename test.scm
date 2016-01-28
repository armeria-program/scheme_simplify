(define (test)
  (begin
    (display "test1: ")
    (display (test1) )

    (newline)
    (display "test2: ")
    (display (test2) )

    (newline)
    (display "test3: ")
    (display (test3) )

    (newline)
    (display "test4: ")
    (display (test4) )
))

(define (test1) (simplify '1))

(define (test2) simplify '(+ 1 3))

(define (test3) ( let (v 3) (simplify '(+ 1 v))))

(define (test4) (simplify '(+ (+ 2 v) (+ 1 3) )))
