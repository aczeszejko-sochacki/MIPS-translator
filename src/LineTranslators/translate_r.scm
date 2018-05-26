;;; Translates full line of
;;; three registers-based MIPS
;;; instruction to machine code
(define (translate-r command)

  ;;; Decode function
  (define function (decode-function (car command)))
  
  ;;; List of encoded registers
  (define encoded-registers (cdr command))

  ;; Decode registers
  (define decoded-registers
    (map decode-register encoded-registers))

  ;; List of decoded components
  (define decoded-components
    (list
      function
      (make-bit-string 5 #f)
      (car decoded-registers)
      (caddr decoded-registers)
      (cadr decoded-registers)
      (make-bit-string 6 #f)))

  ;; Concatenated decoded components
  (define whole-decoded-binary
    (reduce-left 
      bit-string-append
      (make-bit-string 0 0)
      decoded-components))

  (decode-binary whole-decoded-binary))
  
  
