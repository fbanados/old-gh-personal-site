#lang racket/base

(require "utils.rkt")
(provide blog)

(define blog
  (generate-page
   "blog"
   `((h2 "Blog")
     (p "TBD")
     (p "The opinions in this blog are only representative of the author"))))

