;;;###autoload
(defun +org-private/org-html--tags (tags info)
  "Format TAGS into HTML.
INFO is a plist containing export options."
  (when tags
    (format
     "
<span class=\"tag\">%s</span>
"
     (mapconcat
      (lambda (tag)
        (format
         "<span class=\"%s\">%s</span>"
         (concat
          (plist-get
           info
           :html-tag-class-prefix)
          (org-html-fix-class-name tag))
         tag))
      tags
      " "))))

