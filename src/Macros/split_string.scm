;;; This is the implementation of splitting
;;; string, did because of lack of simmilar
;;; function in MIT Scheme
(define (split-string line delimeter)
 
   ;;; List of words in line
  (define words (list))

  ;;; Main split function
  (define (split)

    ;;; Delimeter indexes in line
    (define delimeter-indexes
      (string-search-all delimeter line))
    
    ;; Action here
    (if (null? delimeter-indexes)
      (set! words (append! words (list line)))
      (begin
        (set! words 
          (append! words 
            (list (string-head line (car delimeter-indexes)))))
        (set! line 
          (string-tail line 
             (+ 1 (car delimeter-indexes))))
        (set! delimeter-indexes (cdr delimeter-indexes))
        (split))))

(split))
