;;; Translates passed line of MIPS code
;;; to AT&T Assembler code
;;; This is simulation of an object
(define (lexer)

  ;;; Translates line of code
  (define (translate-line line)

    ;;; Instance of splitting object
    (define split (split-string line " "))
    
    ;;; List of words in line
    (define words ((split 'split)))

    ;;; Another instance of splitting object
    (define split-operands (split-string (cadr words) ","))
    
    ;;; List of operands
    (define operands ((split-operands 'split)))

    (define (translate-operation)
      (cond ((string=? (car words) "sub") (sub operands))
            (else line)))

  (translate-operation))

  (define (dispatch message)
    (cond ((eqv? message 'translate-line) translate-line)))

dispatch)
