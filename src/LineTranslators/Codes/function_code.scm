;;; Table of codes of the functions 
(define (decode-function function)
  
  ;;; Decode to decimal value
  (define decimal-decoded-function
    (cond
      ;; R function codes 
      ((string=? function "add") 32)
      ((string=? function "addu") 33)
      ((string=? function "sub") 34)
      ((string=? function "subu") 35)
      ((string=? function "and") 36)
      ((string=? function "or") 37)
      ((string=? function "xor") 38)
      ((string=? function "nor") 39)
      ((string=? function "mult") 24)
      ((string=? function "multu") 25)
      ((string=? function "div") 26)
      ((string=? function "divu") 27)
      ((string=? function "mfhi") 16)
      ((string=? function "mthi") 17)
      ((string=? function "mflo") 18)
      ((string=? function "mtlo") 19)
      ((string=? function "slt") 42)
      ((string=? function "sltu") 43)
      ((string=? function "sll") 0)
      ((string=? function "srl") 2)
      ((string=? function "sra") 3)
      ((string=? function "sllv") 4)
      ((string=? function "srlv") 6)
      ((string=? function "srav") 7)

      ;; I function codes
      ((string=? function "addi") 8)
      ((string=? function "addiu") 9)
      ((string=? function "slti") 10)
      ((string=? function "sltiu") 11)
      ((string=? function "andi") 12)
      ((string=? function "ori") 13)
      ((string=? function "xori") 14)
      ((string=? function "lui") 15)))

  ;; Decode to binary value on six bits
  (unsigned-integer->bit-string 
    6 
    decimal-decoded-function))
    

  
