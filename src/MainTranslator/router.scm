;;; Receives series of words
;;; and redirects to proper translator
(define (router command)

  ;;; Instruction name
  (define instruction (car command))

  ;;; List of instructions on three registers
  (define register-instructions
    (list "add" "addu" "sub" "subu" "mult" 
     "multu" "div" "divu" "mfhi" "mthi" "mflo" 
     "mtlo" "and" "or" "xor" "nor" "slt" "sltu"
     "sll" "srl" "sra" "sllv" "srlv" "srav"))

  ;;; List of instructions on two registers
  (define immediate-instructions
    (list "addi" "addiu" "andi" "ori" "xori" 
      "lui" "slti" "sltiu"))

  ;; Invoke proper translation
  (cond 
    ((member instruction register-instructions)
      (translate command "r"))
    ((member instruction immediate-instructions)
      (translate command "i"))
    (else (error "Incorrect MIPS Code"))))
