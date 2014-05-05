#lang racket/base
(require xml)
(require racket/file)

;; xexpr->file : xexpr file -> void
;; pukes an xexpr to a file.
(define (xexpr->file xexpr file)
  (display-to-file (string-append "<!DOCTYPE html>"
                                  (xexpr->string xexpr))
                   file
                   #:exists 'replace))

;; twitter-bootstrap : -> (listof xexpr)
(define (twitter-bootstrap)
  '((link ((rel "stylesheet")
           (href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")))
    (link ((rel "stylesheet")
           (href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")))
    (script ((src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")))))

;; standard-header-titled : (listof xexpr) -> xexpr
;; Generetes a header with the required title.
(define (standard-header-titled title)
    (append `(head
              ,(cons 'title title))
            (twitter-bootstrap)))
  

(define test
  `(html
    ,(standard-header-titled '("Felipe Ba" ntilde "ados Schwerter @ UBC"))
    (body
     (div ((class "container"))
          (h1 "Felipe Ba" ntilde "ados Schwerter")
          (p "PhD student at the "
             (a ((href "http://cs.ubc.ca")) "Department of Computer Science")
             ", "
             (a ((href "http://science.ubc.ca")) "Faculty of Science")
             " of the "
             (a ((href "http://www.ubc.ca")) "University of British Columbia"))
          (p "BESc. in Computer Science, "
             (a ((href "http://dcc.uchile.cl")) "Department of Computer Science")
             ", "
             (a ((href "http://ingenieria.uchile.cl")) "Faculty of Physical and Mathematical Sciences")
             ", "
             (a ((href "http://www.uchile.cl/english")) "University of Chile"))
          (p "I'm Chilean, so I carry"
             (a ((href "https://en.wikipedia.org/wiki/Hispanic_American_naming_customs")) "Two family names")
             ". I can also be called Felipe Ba"
             ntilde
             "ados.")))))

(define site
  `(("index.html" ,test)))

(define (generate-site)
  (display "Generating site... This overrides any documents")
  (map (lambda (pair) (apply xexpr->file (reverse pair))) site))

(generate-site)
