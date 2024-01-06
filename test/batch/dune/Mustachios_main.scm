(load "alist.scm")
(load "mibl.scm")
(format *stderr* "Reader: ~A~%" reader)
(format *stderr* "Datafile: ~A~%" datafile)
(format *stderr* "Template: ~A~%" template)

(let* ((data (with-input-from-file datafile reader))
       ;(data (dune->mibl data))
       (data (alist->hash-table data))
       (template (call-with-input-file template
                   (lambda (p)
                     (let ((tlen (length p)))
                       (read-string tlen p)))))
      ;; (ht (alist->hash-table data))
      )
  (format *stderr* "ht?: ~A~%" (hash-table? data))
  (format *stderr* "DATA:~%~A~%" data)
  (format *stderr* "TEMPLATE:~%~A~%" template)
  (call-with-output-file outfile
    (lambda (p)
      (write data p)
      ;(mustache:render p template data 0)
      ))
  )

      ;; (format p "Hello~%")
      ;; (write data p)
      ;; (newline p)
      ;; (write mibl p)))