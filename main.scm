;;; Imports
(load "src/MainTranslator/mips_code.scm")
(load "src/MainTranslator/lexer.scm")
(load "src/MainTranslator/router.scm")
(load "src/MainTranslator/formatter.scm")
(load "src/Macros/split_string.scm")
(load "src/Macros/bin_to_hex.scm")
(load "src/Macros/dec_to_bin.scm")
(load "src/LineTranslators/translate.scm")
(load "src/LineTranslators/Codes/function_code.scm")
(load "src/LineTranslators/Codes/register_code.scm")
(load "src/LineTranslators/Codes/address_code.scm")

;;; Read name of the file to execute
(define file-name 
  (string-append "tests/" (read)))

;;; Make an instance of the translator
(define new-mips-code (mips-code file-name))

;;; Can both print result and save it in the
;;; specified file
((new-mips-code 'read-file))
((new-mips-code 'translate-file))
((new-mips-code 'print-translated))
