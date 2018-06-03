;;; Translates command using rd, rs, rt
(define (translate-rd-rs-rt function registers)

  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 6 #\0)
      (decode-register (cadr registers))
      (decode-register (caddr registers))
      (decode-register (car registers))
      (make-string 5 #\0)
      (decode-function function)))

(bin-to-hex decoded-components 8))


;;; Translates command using rd, rt, rs
(define (translate-rd-rt-rs function registers)

  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 6 #\0)
      (decode-register (caddr registers))
      (decode-register (cadr registers))
      (decode-register (car registers))
      (make-string 5 #\0)
      (decode-function function)))

(bin-to-hex decoded-components 8))


;;; Translates command using rs, rt, im
 (define (translate-rs-rt-im function registers)
 
   ;;; String of decoded components
   (define decoded-components
     (string-append
       (decode-function function)
       (decode-register (cadr registers))
       (decode-register (car registers))
       (decode-immediate (caddr registers) 16)))
 
(bin-to-hex decoded-components 8))


;;; Translate command using rd, rt, sa
(define (translate-rd-rt-sa function registers)
  
  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 11 #\0)
      (decode-register (cadr registers))
      (decode-register (car registers))
      (decode-immediate (caddr registers) 5)
      (decode-function function)))

(bin-to-hex decoded-components 8))


;;; Translate command using rs, rt
(define (translate-rs-rt function registers)

  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 6 #\0)
      (decode-register (car registers))
      (decode-register (cadr registers))
      (make-string 10 #\0)
      (decode-function function)))

(bin-to-hex decoded-components 8))


;;; Translate command using rd
(define (translate-rd function register)

  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 16 #\0)
      (decode-register register)
      (make-string 5 #\0)
      (decode-function function)))

(bin-to-hex decoded-components 8))


;;; Translate command using rs
(define (translate-rs function register)

  ;;; String of decoded components
  (define decoded-components
    (string-append
      (make-string 6 #\0)
      (decode-register register)
      (make-string 15 #\0)
      (decode-function function)))

(bin-to-hex decoded-components 8))
