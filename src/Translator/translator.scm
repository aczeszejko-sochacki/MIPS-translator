;;; Main function. Translates MIPS code to Asembler code.
;;; This is simulation of an object
(define (translator input-file output-file)

  ;;; Variables with content of input and output file
  (define input-file-content (list))
  (define output-file-content "")
  ;;; I/O
  (define in (open-input-file input-file))
  (define out (open-output-file output-file))
	
  ;;; Writes content of input file to input-file-content
  (define (read-file)
    (define new-line (read-line in))
		
    (if (eof-object? new-line)
      (close-input-port	in)
      ((begin
        (set! input-file-content (
          append! input-file-content (list new-line)))
        read-file))))

  ;;; Translates MIPS code
  (define (translate-file)
    ;; To do
    (set! output-file-content input-file-content))

  ;;; Writes translated code to file
  (define (write-to-file)
  (begin
    (display ".text" out)
    (display output-file-content out)			
    (close-output-port out)))

  (define (dispatch message)
    (cond ((eqv? message 'read-file) read-file)
          ((eqv? message 'translate-file) translate-file)
          ((eqv? message 'write-to-file) write-to-file)))

dispatch)
