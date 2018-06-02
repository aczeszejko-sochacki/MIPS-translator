;;; Table of codes of the registers
(define (decode-register register)

  ;;; Register match pattern $[a..z][0..9]
  (define (decimal-decoded-register-alpha)

    ;;; First letter is helpful in decoding
    (define first-letter (string-ref register 1))

    ;;; Number in code of the register
    (define number
      (char->digit (string-ref register 2)))

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
        (+ 26 number))
      ((char=? first-letter #\t)
        (if (< number 8)
          (+ 8 number)
          (+ 16 number)))))

  ;;; Register match pattern $[0..9][0..9]
  (define decimal-decoded-register-numeric
    (string->number (string-tail register 1)))


  (if (char-numeric? (string-ref register 1))
    (dec-to-bin decimal-decoded-register-numeric 5)
    (dec-to-bin (decimal-decoded-register-alpha) 5)))

