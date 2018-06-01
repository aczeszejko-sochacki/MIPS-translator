;;; Imports
(load "src/MainTranslator/translator.scm")
(load "src/MainTranslator/splitter.scm")
(load "src/MainTranslator/router.scm")
(load "src/Macros/split_string.scm")
(load "src/Macros/bin_to_hex.scm")
(load "src/Macros/dec_to_bin.scm")
(load "src/LineTranslators/translate.scm")
(load "src/LineTranslators/Codes/function_code.scm")
(load "src/LineTranslators/Codes/register_code.scm")
(load "src/LineTranslators/Codes/address_code.scm")

;;; Read name of file to execute
(define file-name 
  (string-append "tests/" (read)))

;;; Make an instance of the translator
(define new-translator (translator file-name))

;;; Can both print result and save it in the
;;; specified file
((new-translator 'read-file))
((new-translator 'translate-file))
((new-translator 'print-translated))
