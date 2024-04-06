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
[
  (call_expression (identifier))
  (member_expression (identifier))
  (binary_expression (identifier))
] @object.identifier
