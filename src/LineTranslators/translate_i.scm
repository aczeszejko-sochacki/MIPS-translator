;;; Translates full line of
;;; two registers-based MIPS
;;; instruction to machine code
(define (translate-i command)

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
      (car decoded-registers)
      (caddr decoded-registers)
      (cadr decoded-registers)
      function))
      
  ;; Concatenated decoded components
  (define whole-decoded-binary
    (reduce-left 
      bit-string-append
      (make-bit-string 0 0)
      decoded-components))

  (decode-binary whole-decoded-binary))
  
  
