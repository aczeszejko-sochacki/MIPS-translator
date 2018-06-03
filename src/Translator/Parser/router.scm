;;; Receives series of words
;;; and redirects to proper translator
(define (router command)

  ;;; Instruction name
  (define instruction (car command))

  ;;; List of instructions rs-rt-rd
  (define rs-rt-rd
    (list "add" "addu" "sub" "subu"
     "and" "or" "xor" "nor" "slt" "sltu"
     "sllv" "srlv" "srav"))

  ;;; List of rs-rt-im-instructions
  (define rs-rt-im
    (list "addi" "addiu" "andi" "ori" "xori" 
      "lui" "slti" "sltiu"))

  ;;; List of shift-variable instructions
  (define rt-rd-sa
    (list "sll" "srl" "sra"))

  ;;; List of rs-rt instructions
  (define rs-rt
    (list "div" "divu" "mult" "multu"))

  ;;; List of rd instructions
  (define rd
    (list "mfhi" "mflo"))

  ;;; List of rs instructions
  (define rs
    (list "mthi" "mtlo"))

  ;; Invoke proper translation
  (cond 
    ((member instruction rs-rt-rd)
      (translate-rs-rt-rd instruction (cdr command)))
    ((member instruction rs-rt-im)
      (translate-rs-rt-im instruction (cdr command)))
    ((member instruction rt-rd-sa)
      (translate-rt-rd-sa instruction (cdr command)))
    ((member instruction rs-rt)
      (translate-rs-rt instruction (cdr command)))
    ((member instruction rd)
      (translate-rd instruction (cdr command)))
    ((member instruction rs)
      (translate-rs instruction (cdr command)))
    (else (error "Incorrect MIPS Code"))))
