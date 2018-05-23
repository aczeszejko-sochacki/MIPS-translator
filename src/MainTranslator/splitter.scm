;;; Splits line of code to instruction
;;; and operands
;;; This is simulation of an object
(define (splitter)

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
    
    ;;; Instruction + operands
    (define to-translation
      (append! (list (car words) operands)))
    
    ;;; Passes splitted data and receives translated
    (define (translate-operation)
      to-translation)

    (translate-operation))

  (define (dispatch message)
    (cond ((eqv? message 'translate-line) translate-line)))

dispatch)
