;;; Splits line of code to instruction
;;; and operands

;;; This is simulation of an object
(define (splitter line)
    
  ;;; List of words in line
  ;;; Remove comment if existed
  (define words 
    (list-head (split-string line " ") 2))
    
  ;;; List of operands
  (define operands (split-string (cadr words) ","))
    
  ;;; Instruction + operands
  (define to-translation
    (append! (list (car words)) operands))
    
  ;; Passes splitted data and receives translated
  (router to-translation))
