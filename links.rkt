#lang racket/base
(require "utils.rkt")
(provide links)

(define (gen-link lst)
  (list 'li `(a ((href ,(car lst))) ,(cadr lst))
	`(ul (li ,(caddr lst)))))

(define linklist
  '(("http://www.technologyreview.com/featuredstory/531726/technology-and-inequality/"
     "Technology and Inequality"
     "The disparity between the rich and everyone else is larger than ever in the United States and increasing in much of Europe. Why?. By David Rotman on the MIT Technology Review")
    ("http://berkeleysciencereview.com/article/mind-grad-school/"
     "This is your mind on grad school"
     "The state of graduate student mental health at UC Berkeley. By Denia Djoki&cacute; and Sebastien Lounis on the Berkeley Science Review")
    ("http://betweenarock.co.uk/phd-musings/things-i-wish-i-knew-when-i-started-my-phd/"
     "Things I wish I knew when I started my PhD"
     "A set of interesting 34 points.")))


(define links
  (generate-page
   "links"
   `((h2 "Links")
     (div ((class "container"))
	  ,(append '(ul)
		   (map gen-link linklist))))))
