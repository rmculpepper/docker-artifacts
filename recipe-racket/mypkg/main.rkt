#lang racket/base
(require crypto crypto/libcrypto)
(provide sha384)

(define sha384-digest (get-digest 'sha384 libcrypto-factory))

(define (sha384 str)
  (digest sha384-digest str))
