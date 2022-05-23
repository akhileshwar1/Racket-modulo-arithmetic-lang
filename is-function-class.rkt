#lang racket

(provide
  ; syntax class that matches a list of identifiers
  ; and checks for duplicates.
  function)

; --------------------------------------------------------------------------------------------------- 
(require syntax/parse)

; ---------------------------------------------------------------------------------------------------


(define-syntax-class function 
                     [pattern  x:id
                              #:fail-when (not (identifier-binding #'x))                                                                       "not a function"])
