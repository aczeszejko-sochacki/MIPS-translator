;;; Decode bit-string to hexadecimal
(define (decode-binary command)

  ;;; Decoded to hexadecimal
  (define decoded-hex 
    (number->string 
      (bit-string->signed-integer command) 
      16))

  ;;; Need to return value on 8 digits
  (define additional-zeros
    (make-string 
      (- 8 (string-length decoded-hex)) 
      #\0))

  ;; Return final version of decoded command
  (string-upcase 
    (string-append additional-zeros decoded-hex)))
