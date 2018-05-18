;;; Imports
(load "src/Translator/lexer.scm")

;;; Main function. Translates MIPS code to Asembler code.
;;; This is simulation of an object
(define (translator input-file output-file)

  ;;; Variables with content of input and output file
  (define input-file-content (list))
  (define output-file-content (list))
  ;;; I/O
  (define in (open-input-file input-file))
  (define out (open-output-file output-file))
	
  ;;; Writes content of input file to input-file-content
  (define (read-file)
    (define new-line (read-line in))
		
    (if (eof-object? new-line)
      (close-input-port	in)
      ((begin
        (set! input-file-content 
        (append! input-file-content (list new-line)))
        read-file))))

  ;;; Translates MIPS code
  (define (translate-file)         
    (if (null? input-file-content)
      (error "Translating empty file")  ; Raise exception
      (set! output-file-content 
        (map lexer input-file-content))))  ; Lexer line by line

  ;;; Writes translated code to file
  (define (write-to-file)
    (define (write-line line)
      (display line out)
      (newline out))

    (begin
      (display ".text" out)
      (newline out)
      (map write-line output-file-content)			
      (close-output-port out)))

  (define (dispatch message)
    (cond ((eqv? message 'read-file) read-file)
          ((eqv? message 'translate-file) translate-file)
          ((eqv? message 'write-to-file) write-to-file)))

dispatch)
