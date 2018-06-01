;;; Imports
(load "src/MainTranslator/translator.scm")
(load "src/MainTranslator/splitter.scm")
(load "src/MainTranslator/router.scm")
(load "src/SplitString/split_string.scm")
(load "src/LineTranslators/translate.scm")
(load "src/LineTranslators/Codes/function_code.scm")
(load "src/LineTranslators/Codes/register_code.scm")
(load "src/LineTranslators/Codes/hexadecimal_code.scm")
(load "src/LineTranslators/Codes/address_code.scm")

;;; Make an instance of the traslator
(define new-translator (
  translator "tests/UnitTests/test1a.txt" "out.txt"))

;;; Can both print result and save it in the
;;; specified file
((new-translator 'read-file))
((new-translator 'translate-file))
((new-translator 'print-translated))
((new-translator 'write-to-file ))
