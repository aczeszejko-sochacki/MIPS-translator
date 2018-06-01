;;; Decode decimal int
;;; to binary string on n digits
(define (dec-to-bin decimal n)

  ;;; Decoded to binary
  (define binary
    (number->string decimal 2))
  
   ;; Return value aligned to n bits
   (string-append
     (make-string
       (- n (string-length binary))
       #\0)
     binary))

