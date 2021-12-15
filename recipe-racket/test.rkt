#lang racket/base
(require crypto
         mypkg
         rackunit)

(check-equal? (sha384 "abc")
              (hex->bytes
               (bytes-append #"cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed"
                             #"8086072ba1e7cc2358baeca134c825a7")))