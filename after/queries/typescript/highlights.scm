;; extends

[
  (pair)
    [
      ";"
      ","
      "."
    ] @punctuation.terminator.statement
    ":" @punctuation.separator.keyvalue
  (arguments)
    [
      ";"
      ","
      "."
    ] @punctuation.terminator.statement
]
(type_annotation
  ":" @punctuation.separator.keyvalue)
