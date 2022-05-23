#lang racket

(provide mod)

; -------------------------------------------------------------------------------------------------
(require (for-syntax racket/list))
(require (for-syntax racket/match))
(require (for-syntax racket/syntax))
(require racket/stxparam)
(require (for-syntax syntax/parse))
(require rackunit)
(require syntax/macro-testing)
(require rackunit/text-ui)
(require (for-syntax "is-function-class.rkt"))

; -------------------------------------------------------------------------------------------------
(define-syntax (mod stx)
  (syntax-parse stx
    [(_ (~var n id) (~var x nat)) #'(define n x)]))

(mod n 10)
(displayln n)

(define-syntax (Z stx)
  (syntax-parse stx
    [(_ operator:function)
     #:with operator.n (format-id #'operator "~a.~a" #'operator #'n)
     #'(define-syntax (operator.n stx)
                      (syntax-parse stx
                        [(_ (~or* ex:id ex:nat ex:expr) (... ...)) #'(remainder (operator (Z ex) (... ...)) n)]))]
    [(_  (~or* ex:id ex:nat ex:expr)) #'(remainder ex n)]))

(define a 15)
(identifier-binding #'a)
(Z a)
(Z (+ 20 6))
(Z 7)
(Z +)
(Z -)
(+.n 15 10)
(+.n (+ 2 15) (+ 3 5))
(-.n 26 3)
(+.n 15 (-.n 26 3))
