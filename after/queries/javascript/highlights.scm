;; extends
(pair
  [
    ";"
    ","
  ] @punctuation.terminator.statement
  ":" @punctuation.separator.keyvalue)
(pair
  ":" @punctuation.separator.keyvalue)
[
  (call_expression (identifier))
  (member_expression (identifier))
  (binary_expression (identifier))
] @object.identifier
