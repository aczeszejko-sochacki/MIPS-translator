;;; Concatenate addresses, translated
;;; commands and untranslated commands
(define (formatter input-file-content)

  ;;; Addresses of commands
  (define addresses
    (add-address input-file-content))
  
  ;;; Translated line by line commands
  (define translated
    (map lexer input-file-content))
  
  ;;; Need a delimeter between informations
  (define spaces
    (make-list (length input-file-content) "    "))
 
  ;;; Need a newline after each line
  (define newlines
    (make-list (length input-file-content) "\n"))

  ;;; Need to delete comments
  (define instruction
    (map 
      (lambda (line) (car (split-string line " ")))
      input-file-content))

  ;;; Need to delete comments
  (define arguments
    (map
      (lambda (line) (cadr (split-string line " ")))
      input-file-content))
  
  ;;; Merged words in lines
  (define merged-lines
    (map
      string-append
      addresses
      spaces
      translated
      spaces
      instruction
      spaces
      arguments
      newlines))
 
  ;;; Merged translated lines
  (string-append
    ".text\n"
    (reduce-left string-append "" merged-lines)))
