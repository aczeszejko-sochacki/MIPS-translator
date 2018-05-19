;;; Imports
(load "src/Translator/translator.scm")
(load "src/Translator/lexer.scm")
(load "src/SplitString/split_string.scm")
(load "src/Instructions/sub.scm")

;;; Make an instance of the traslator
(define new-translator (
  translator "tests/test1a.txt" "out.txt"))
((new-translator 'read-file))
((new-translator 'translate-file))
((new-translator 'write-to-file))
