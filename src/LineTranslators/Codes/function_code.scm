;;; Table of codes of the functions 
(define (decode-function function)

  ;;; Helpful macro
  (define (equal instruction)
    (string=? function instruction))
 
  ;;; Decode to decimal value
  (define decimal-decoded-function
  
    (cond
      ;; R function codes 
      ((equal "add") 32)
      ((equal "addu") 33)
      ((equal "sub") 34)
      ((equal "subu") 35)
      ((equal "and") 36)
      ((equal "or") 37)
      ((equal "xor") 38)
      ((equal "nor") 39)
      ((equal "mult") 24)
      ((equal "multu") 25)
      ((equal "div") 26)
      ((equal "divu") 27)
      ((equal "mfhi") 16)
      ((equal "mthi") 17)
      ((equal "mflo") 18)
      ((equal "mtlo") 19)
      ((equal "slt") 42)
      ((equal "sltu") 43)
      ((equal "sll") 0)
      ((equal "srl") 2)
      ((equal "sra") 3)
      ((equal "sllv") 4)
      ((equal "srlv") 6)
      ((equal "srav") 7)

      ;; I function codes
      ((equal "addi") 8)
      ((equal "addiu") 9)
      ((equal "slti") 10)
      ((equal "sltiu") 11)
      ((equal "andi") 12)
      ((equal "ori") 13)
      ((equal "xori") 14)
      ((equal "lui") 15)))

  ;;; Decode decimal to binary
(dec-to-bin decimal-decoded-function 6))
  
