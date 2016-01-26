(define (let-test)
  (let ((runner (randint -5 10)))
    (cond ((and (< runner 1) (> runner -3))
           "yes")
          ((and (< runner -2) (> runner -6))
           "no")
          ((> runner 0)
           runner))))

           (define (randint . args)
             (cond ((= (length args) 1)
             (floor (* (5) (car args))))
             ((= (length args) 2)
             (+ (car args) (floor (* (random) (- (cadr args) (car args))))))
             (else (error 'randint "usage: (randint [lo] hi)"))))

(define (random)
  (let ((a 69069) (c 1) (m (expt 2 32)) (seed 19380110))
    (lambda new-seed
      (if (pair? new-seed)
      (set! seed (car new-seed))
      (set! seed (modulo (+ (* seed a) c) m)))
      (/ seed m))))