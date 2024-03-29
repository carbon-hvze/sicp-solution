#lang racket

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend sum)
  (cadr sum))

(define (augend sum)
  (caddr sum))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier prod)
  (cadr prod))

(define (multiplicand prod)
  (caddr prod))

(define (=number? expr numb)
  (and (number? expr) (= expr numb)))

(provide variable?
	 same-variable?
	 make-sum
	 make-product
	 sum?
	 addend
	 augend
	 product?
	 multiplier
	 multiplicand
	 =number?)
