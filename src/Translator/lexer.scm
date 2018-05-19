;;; Imports
(load "src/Operands/add.scm")

;;; Translates passed line of MIPS code
;;; to AT&T Assembler code
;;; This is simulation of an object
(define (lexer)
  ;;; Translates line of code
  (define (translate-line line)
    line)

  (define (dispatch message)
    (cond ((eqv? message 'translate-line) translate-line)))

dispatch)
