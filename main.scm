;;; Imports
(load "src/Translator/translator.scm")

;;; Make an instance of the traslator
(define new-translator (
  translator "tests/test1a.txt" "out.txt"))
((new-translator 'read-file))
((new-translator 'translate-file))
((new-translator 'write-to-file))
