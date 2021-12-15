#lang racket/base
(require racket/runtime-path
         racket/file
         mypkg
         crypto)

(define-runtime-path shared-dir "shared")

(define input (file->bytes (build-path shared-dir "input.txt")))
(define digest (sha384 input))

(with-output-to-file (build-path shared-dir "output.bin")
  #:exists 'replace
  (lambda () (write-bytes digest)))
(with-output-to-file (build-path shared-dir "output.hex")
  #:exists 'replace
  (lambda () (write-bytes (bytes->hex digest))))
