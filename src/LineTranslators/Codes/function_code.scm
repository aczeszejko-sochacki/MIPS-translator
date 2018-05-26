;;; Table of codes of the functions 
(define (decode-function function)
  
  ;;; Decode to decimal value
  (define decimal-decoded-function
    (cond 
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
      ((string=? function "mtlo") 19)))

  ;; Decode to binary value on six bits
  (unsigned-integer->bit-string 
    6 
    decimal-decoded-function))
    

  
