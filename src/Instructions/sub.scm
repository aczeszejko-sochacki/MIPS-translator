;;; Translation of MIPS sub command
(define (sub operands)
  (string-append
    "mov "
    (cadr operands)
    ","
    (car operands)
    "\nsub "
    (caddr operands)
    ","
    (car operands)))

