;t;; Imports
(load "src/Translator/Parser/mips_code.scm")
(load "src/Translator/Parser/lexer.scm")
(load "src/Translator/Parser/router.scm")
(load "src/Translator/Parser/formatter.scm")
(load "src/Macros/split_string.scm")
(load "src/Macros/bin_to_hex.scm")
(load "src/Macros/dec_to_bin.scm")
(load "src/Translator/LineTranslator/line_translator.scm")
(load "src/Translator/LineTranslator/Codes/function_code.scm")
(load "src/Translator/LineTranslator/Codes/register_code.scm")
(load "src/Translator/LineTranslator/Codes/address_code.scm")
(load "src/Translator/LineTranslator/Codes/immediate_code.scm")

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
