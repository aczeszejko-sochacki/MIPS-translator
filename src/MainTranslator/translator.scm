;;; Main function. Reads code from file, passes
;;; it to translator, receives translated to
;;; machine code, returns machine code
;;; and saves it in a file
;;; This is simulation of an object
(define (translator input-file)

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

    ;;; Addresses of commands
    (define addresses
      (add-address input-file-content))

    ;;; Translated line by line commands
    (define translated
      (map splitter input-file-content))

    ;;; Need a delimeter between informations
    (define spaces
      (make-list (length input-file-content) "    "))

    ;;; Need a newline after each line
    (define newlines
      (make-list (length input-file-content) "\n"))

    ;;; Merged words in lines
    (define merged-lines
        (map 
          string-append 
          addresses 
          spaces
          translated
          spaces
          input-file-content
          newlines))

    ;;; Merged translated lines
    (set!
      output-content
      (string-append
        ".text"
        "\n"
        (reduce-left string-append "" merged-lines))))
    

  ;;; Get output file content
  (define (print-translated) 
    (display output-content))


  (define (dispatch message)
    (cond ((eqv? message 'read-file) read-file)
          ((eqv? message 'translate-file) translate-file)
          ((eqv? message 'print-translated) print-translated)))

dispatch)
