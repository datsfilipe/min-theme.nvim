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
((identifier) @tag.jsx.element
 (#match? @tag.jsx.element "^[A-Z]")
 (#set! "priority" 110))
