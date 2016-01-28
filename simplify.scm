;simlify Assignment 1
;Authors: Ryan McConn Ebitimi Agberebi

(define (simplify x)
  (
    if (atom? x) x
    ;else
    (let* ((oprate (car x)) (op1s (simplify(cadr x ))) (op2s (simplify(cadr (cdr x))))
      (op1sExOp (op-not-atom op1s)) (op2sExOp (op-not-atom op2s)) (oprIsMul (opr-is-mul oprate))
      (oprIsPlus (opr-is-plus oprate)) (env (make-top-level-environment))
      ;Note if these vars are only used once we can remove from "let" also
      ;I think we can return false or the operand from "op-not-atom" and avoid a second test.
      )
      (state-print oprate op1s op2s oprIsMul op1sExOp op2sExOp)
      (cond ((and (not op1sExOp) (not op2sExOp))
                (cond((and (number? op1s) (number? op2s))
                        (display oprate)
                        (display op2s)
                        (environment-define env '* *)
                        (environment-define env '+ +)
                        (environment-define env 'ex oprate)
                        (environment-define env 'a op1s)
                        (environment-define env 'b op2s)
                        (eval '(ex a b) env)
                    ))
                  )
            (list oprate op1s op2s);test output
      )
    )
  )
)

(define (state-print oprate op1s op2s oprIsMul op1sExOp op2sExOp)
  (begin
    (display (list oprate op1s op2s))
    (newline)
    (display (string-append "\t\t" "vars: oprIsMul:" (write-to-string oprIsMul)
      " op1sExOp:" (write-to-string op1sExOp)
      " op2sExOp: " (write-to-string op2sExOp) ))
      (newline)
      (newline)

  )
)

(define (run) (simplify '(+ 1 v)))

(define (run2) (simplify '(+ (+ 2 v) (+ 1 3) )))

(define (test1) (simplify '1))

(define (test) simplify '(+ 1 3))

;after first running (load "simplify.scm") calling this reloads
(define (loadf)
	(begin
    (load "simplify.scm")
		(load "atom?.scm")
		(load "op-not-atom.scm")
		(load "opr-is-mul.scm")
    (load "opr-is-plus.scm")
))
