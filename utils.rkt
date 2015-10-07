#lang racket/base
(require racket/file)
(require xml)
(require "headers.rkt")

(provide xexpr->file
         link
         generate-page)

;; xexpr->file : xexpr file -> void
;; pukes an xexpr to a file.
(define (xexpr->file xexpr file)
  (display-to-file (string-append "<!DOCTYPE html>"
                                  (xexpr->string xexpr))
                   file
                   #:exists 'replace))

(define (link desc url)
  `(a ((href ,url))
      ,desc))

(define (generate-page title body)
  `(html
    ,(standard-head-titled '("Felipe Ba" ntilde "ados Schwerter @ UBC"))
    (body
     ,(append '(div ((class "container")))
              (generate-page-header title)
              body)
     (hr)
     (footer ((role "contentinfo"))
             (div ((class "container"))
                  (p ((class "text-center"))
                     (small "The University of British Columbia is located on the traditional, ancestral, and unceded territory of the "
                            ,(link "Musqueam People"
                                   "http://aboriginal.ubc.ca/community-youth/musqueam-and-ubc/"
                                   )))))
     )))
