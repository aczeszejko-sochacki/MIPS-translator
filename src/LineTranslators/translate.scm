;;; Translates full line of
;;; three registers-based MIPS
;;; instruction to machine code
(define (translate command kind)

  ;;; Decode function
  (define function (decode-function (car command)))
  
  ;;; List of encoded registers
  (define encoded-registers
    ;; Need to remove comment if existed
    (append! 
      (list (cadr command))
      (list (caddr command))
      (list (cadddr command))))

  ;; Decode registers
  (define decoded-registers
    (map decode-register encoded-registers))

  ;; List of decoded components (r version)
  (define decoded-components-r
    (string-append
      (make-string 6 #\0)
      (cadr decoded-registers)
      (caddr decoded-registers)
      (car decoded-registers)
      (make-string 5 #\0)
      function))

  ;;; List of decoded components (i version)
  (define decoded-components-i
      (string-append
        (car decoded-registers)
        (caddr decoded-registers)
        (cadr decoded-registers)
        function))

  ;;; Define proper version
  (define decoded-components
    (if (string=? kind "r") 
      decoded-components-r
      decoded-components-i))

  (decode-binary decoded-components))

