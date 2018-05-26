;;; Receives series of words
;;; and redirects to proper translator
(define (router command)

  ;;; Instruction name
  (define instruction (car command))

  ;;; List of instructions on three registers
  (define register-instructions
    (list "add" "addu" "sub" "subu" "mult" "multu" 
      "div" "divu" "mfhi" "mthi" "mflo" "mtlo"
     "and" "or" "xor" "nor"))

  ;;; List of instructions on two registers
  (define immediate-instructions
    (list "addi" "addiu" "subi" "andi" "ori" "xori" 
      "lui" "slti" "sltiu"))

  ;; Need to add shifts

  (if (member instruction register-instructions)
    (translate-r command)
    ;; Else 
    (translate-i command)))
