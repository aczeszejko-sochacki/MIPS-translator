;;; Table of codes of immediates
(define (decode-immediate immediate)
  
  ;;; Decode decimal immediate
  (define (decode-dec value)
    (dec-to-bin
      (bit-string->unsigned-integer
        (signed-integer->bit-string 
          16 
          (string->number value)))
       16))

  ;;; Decode hex immediate
  (define (decode-hex value)
    (decode-dec
      (number->string 
        (string->number 
          (string-tail value 2) 16))))
  
  ;;; Invoke proper decoding
  (cond ((equal? (string-match-forward immediate "0x") 2)
         (decode-hex immediate))
        ((string->number immediate)
         (decode-dec immediate))
        (else (error "Incorrect immediate format"))))

