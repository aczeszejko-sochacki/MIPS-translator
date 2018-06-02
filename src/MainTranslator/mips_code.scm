;;; Main function. Reads code from the specified
;;; file, passes it to formatter, 
;;; receives pretty formatted, translated code 
;;; to machine code and returns machine code
;;; This is simulation of an object
(define (mips-code input-file)

  ;;; Variables with content of input and output
  (define input-file-content (list))
  (define output-content)

  ;;; I/O
  (define in (open-input-file input-file))

  ;;; Writes content of input file to input-file-content
  (define (read-file)
    (define new-line (read-line in))
		
    (if (eof-object? new-line)
      (close-input-port	in)
      ((begin
        (set! input-file-content 
        (append! input-file-content (list new-line)))
        read-file))))

  ;;; Translates MIPS code to machine code
  (define (translate-file)
    (set!
      output-content
      (formatter input-file-content)))

  ;;; Get output file content
  (define (print-translated) 
    (display output-content))


  (define (dispatch message)
    (cond ((eqv? message 'read-file) read-file)
          ((eqv? message 'translate-file) translate-file)
          ((eqv? message 'print-translated) print-translated)))

dispatch)
