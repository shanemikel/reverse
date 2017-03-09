#!/usr/bin/env nix-shell
#! nix-shell -i guile -p guile
!#

(use-modules (ice-9 format))
(use-modules (ice-9 receive))

(define (log10 n)
  (/ (log n) (log 10)))

(define (digit n)
  (inexact->exact (ceiling (log10 n))))

(define (reverse n)
  (define m 0)
  (do ((i (- (digit n) 1) (1- i)))
      ((< i 0))
    (receive (q r) (floor/ n 10)
      (set! n q)
      (set! m (+ m (* r (expt 10 i))))))
  m)

(let ((n (string->number (list-ref (program-arguments) 1))))
  (format #t "~a -> ~a" n (reverse n)))
