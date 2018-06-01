;;; Decode bit-string to hexadecimal
(define (decode-binary command)

  ;;; Decoded to hexadecimal
  (define decoded-hex 
    (number->string (string->number command 2) 16))

  ;; Need to return value on 8 digits
  (string-upcase 
    (string-append
      (make-string
        ( - 8 (string-length decoded-hex))
        #\0)
      decoded-hex)))

