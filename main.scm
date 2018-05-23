;;; Imports
(load "src/MainTranslator/translator.scm")
(load "src/MainTranslator/splitter.scm")
(load "src/SplitString/split_string.scm")

;;; Make an instance of the traslator
(define new-translator (
  translator "tests/test1a.txt" "out.txt"))
((new-translator 'read-file))
((new-translator 'translate-file))
((new-translator 'write-to-file))
