;;; Adresses of commands
(define (add-address input)

  (define numbers
    (map 
      (lambda (line) (number->string line 16))
      (iota (length input) 0 4)))    ; iota ~ linspace
  
  ;;; Need to return values on 8 digits
  (define (align number)
    (string-append
      (make-string
        ( - 8 (string-length number))
        #\0)
      number))

  (map align numbers))
