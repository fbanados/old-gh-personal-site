#lang racket/base
(provide standard-head-titled
         generate-page-header)

;; twitter-bootstrap : -> (listof xexpr)
(define (twitter-bootstrap)
  '((link ((rel "stylesheet")
           (href "http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")))
    (link ((rel "stylesheet")
           (href "http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")))
    (script ((src "http://code.jquery.com/jquery-2.1.1.min.js")))
    (script ((src "http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")))
    ))

;; standard-head-titled : (listof xexpr) -> xexpr
;; Generetes a head with the required title.
(define (standard-head-titled title)
    (append `(head
              ,(cons 'title title))
            (twitter-bootstrap)))

(define (site-url link)
  (string-append "http://fbanados.github.io/" link))

(define (generate-button pagetitle linktitle link buttontitle)
  (if
   (equal? pagetitle linktitle)
   `(li ((class "active"))
        (a ((href ,(site-url link))) ,buttontitle))
   `(li (a ((href ,(site-url link))) ,buttontitle))))
  

(define (generate-page-header title)
  `((h1 "Felipe Ba" ntilde "ados Schwerter")
    (p "PhD student at the "
          (a ((href "https://www.cs.ubc.ca/cs-research/software-practices-lab")) "Software Practices Lab")
          ", "
          (a ((href "http://cs.ubc.ca")) "Department of Computer Science")
          ", "
          (a ((href "http://www.ubc.ca")) "UBC"))
         (nav ((class "navbar navbar-default")
          (role "navigation"))
         (div ((class "container-fluid"))
              (div ((class "navbar-header"))
                   (button ((type "button")
                            (class "navbar-toggle collapsed")
                            (data-toggle "collapse")
                            (data-target "#header-navbar-fb"))
                           (span ((class "sr-only"))
                                 "Toggle navigation")
                           (span ((class "icon-bar")))
                           (span ((class "icon-bar")))
                           (span ((class "icon-bar")))
                           ))
              (div ((class "collapse navbar-collapse")
                    (id "header-navbar-fb"))
                   ,(append '(ul ((class "nav navbar-nav")))
                       (map (lambda (list)
                               (generate-button title
                                                (car list)
                                                (cadr list)
                                                (caddr list)))
                             '(("contact" "index.html" "Contact")
                               ("publications" "publications.html" "Publications")
                               ("activities" "activities.html" "Activities")
                               ("blog" "blog/index.html" "Blog")
			       ("links" "links.html" "Links")))
                       ))))
    ))
