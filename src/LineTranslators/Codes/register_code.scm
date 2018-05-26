;;; Table of codes of the registers
(define (decode-register register)

  ;;; First letter is helpful in decoding
  (define first-letter (string-ref register 1))

  ;;; Number in code of the register
  (define number 
    (char->digit (string-ref register 2)))

  ;;; Decode to decimal value  
  (define decimal-decoded-register
    (cond
      ((string=? register "$zero") 0)
      ((string=? register "$at") 1)
      ((string=? register "$gp") 28)
      ((string=? register "$sp") 29)
      ((string=? register "$fp") 30)
      ((string=? register "$ra") 31)
      ((char=? first-letter #\v) 
        (+ 1 number))
      ((char=? first-letter #\a)
        (+ 4 number))
      ((char=? first-letter #\s)
        (+ 16 number))
      ((char=? first-letter #\k)
        (+ 26 number))))
      ;; need to add t translation
  
  ;; Decode to binary value on five bits
  (unsigned-integer->bit-string
    5
    decimal-decoded-register))
