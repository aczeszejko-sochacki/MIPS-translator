;;; Table of codes of immediates
(define (decode-immediate immediate)
  
  ;;; Decode hex immediate
  (define decode-hex)

  ;;; Decode decimal immediate
  (dec-to-bin
    (bit-string->unsigned-integer
      (signed-integer->bit-string 
        16 
        (string->number immediate)))
    16))

