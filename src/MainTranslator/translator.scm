;;; Main function. Reads code from file, passes
;;; it to translator, receives translated to
;;; machine code, returns machine code
;;; and saves it in a file
;;; This is simulation of an object
(define (translator input-file output-file)

  ;;; Variables with content of input and output file
  (define input-file-content (list))
  (define output-file-content)

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


  ;;; Translates MIPS code to machine code
  (define (translate-file)

    ;;; Instance of splitter
    (define new-splitter (splitter))

    ;;; Addresses of commands
    (define addresses
      (add-address input-file-content))

    ;;; Translated commands
    (define translated
      (map
        (new-splitter 'translate-line)
         input-file-content))    ; Translates line by line

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
      output-file-content
      (string-append
        ".text"
        "\n"
        (reduce-left string-append "" merged-lines))))
    

  ;;; Get output file content
  (define (print-translated) 
    (display output-file-content))

         
  ;;; Writes translated code to file
  (define (write-to-file)
    (begin
      (display output-file-content out)
      (close-output-port out)))


  (define (dispatch message)
    (cond ((eqv? message 'read-file) read-file)
          ((eqv? message 'translate-file) translate-file)
          ((eqv? message 'write-to-file) write-to-file)
          ((eqv? message 'print-translated) print-translated)))

dispatch)
