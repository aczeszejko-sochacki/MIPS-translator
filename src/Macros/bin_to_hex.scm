;;; Decode binary string 
;;; to hexadecimal string on n digits
(define (bin-to-hex binary n)

  ;;; Decoded to hexadecimal
  (define decoded-hex 
    (number->string (string->number binary 2) 16))

  ;; Need to return value on 8 digits
  (string-upcase 
    (string-append
      (make-string
        ( - n (string-length decoded-hex))
        #\0)
      decoded-hex)))

