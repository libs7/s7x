(format #t "load path: ~A~%" *load-path*)
(load "scm/alist.scm")
;; (format *stderr* "Reader: ~A~%" reader)
;; (format *stderr* "Datafile: ~A~%" datafile)
;; (format *stderr* "Template: ~A~%" template)

(let* ((data (with-input-from-file datafile reader))
       (xdata (alist->hash-table data :kw-keys #t)))
  ;; (format *stderr* "DATA: '~A'~%" xdata)
  (call-with-output-file outfile
    (lambda (p)
      (write xdata p))))
      ;; (mustache:render p template xdata 0)))

