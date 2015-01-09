#lang racket/base
;(require xml)
(require racket/file)
(require markdown)
(require "utils.rkt")
(require "links.rkt")
(require "blog.rkt")

(define contact
  (generate-page 
   "contact"
   `((blockquote ((class "blockquote-reverse"))
		 (p "I have no tools because I've destroyed my tools with my tools")
		 (footer "James Mickens, "
			 (cite ((title "The Night Watch"))
			       (a ((href "http://research.microsoft.com/en-us/people/mickens/thenightwatch.pdf"))
				  "The Night Watch"))))
     (h2 "Contact Information")
     (div ((class "container"))
          (div ((class "container")
                (style "width: 250px; float:left; "))
               (img ((src "https://media.licdn.com/media/p/2/000/22b/0d1/0fd318c.jpg")
                     (style "width: 200px; height:auto; "))
                    ))
          (div ((class "container")
                (style "width:auto; "))
               (address
                (strong "ICICS/CS Building") (br)
                "201 - 2366 Main Mall" (br)
                "Vancouver, BC" (br)
                "Canada"(br)
                ,(link "fbanadosATcs.ubc.ca" "#")(br)
                )
               (p "MSc. in Computer Science, "
                  (a ((href "http://dcc.uchile.cl")) "Department of Computer Science")
                  ", "
                  (a ((href "http://ingenieria.uchile.cl/english")) "Faculty of Physical and Mathematical Sciences")
                  ", "
                  (a ((href "http://www.uchile.cl/english")) "University of Chile"))
               (p "I have "
                  (a ((href "https://en.wikipedia.org/wiki/Hispanic_American_naming_customs")) "two family names")
                  ".")
               ))
     (p)
     (img ((src "america_invertida.jpg")
           (alt "America Invertida, Joaquin Torres Garcia. File from wikimedia commons. According to wikimedia, it is public domain in Uruguay."))))))

(define publications
  (generate-page
   "publications"
   `((h2 "Publications")
     (p "TBD"))))

(define activities
  (generate-page
   "activities"
   `((h2 "Activities")
     (ul
      (li "2015: Student Volunteering Co-Chair for the "
          ,(link "20th ACM SIGPLAN International Conference on Functional Programming" "http://icfpconference.org/icfp2015/index.html"))
      (li "2014: Teaching Assistant for "
          ,(link "CPSC 430 Computers and Society" "http://www.cs.ubc.ca/~kevinlb/teaching/cs430/"))
      ))))

(define site
  `(("index.html" ,contact)
    ("publications.html" ,publications)
    ("activities.html", activities)
    ("links.html", links)
    ("blog/index.html", blog)))

(define (generate-site)
  (display "Generating site... This overrides any documents")
  (map (lambda (pair) (apply xexpr->file (reverse pair))) site))

(generate-site)
