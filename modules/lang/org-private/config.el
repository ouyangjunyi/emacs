;; * Export
(defvar +org-html-embed-image t
  "whether image is embeded as base64 in html")
(defvar +org-html-export-style-dir "~/.doom.d/modules/lang/org-private/org-html-head"
  "Directory that contains files to be embeded into org export html.")
(defvar +org-html-export-style-alist '("include.html"
                                       "bootstrap-toc.js"
                                       "bootstrap-toc.css"
                                       "org.js"
                                       "org.css")
  "a list of scripts to be included in org-html-head")
(after! ox-html
  (add-hook 'org-export-before-processing-hook #'+org/org-embed-header)
  ;;(advice-add #'org-html--format-image :override #'+org*org-html--format-image)
  (advice-add 'org-html--tags :override #'+org-private/org-html--tags)
  (setq org-html-checkbox-type 'html
        org-html-mathjax-options
        '((path "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-AMS_SVG")
          (scale "100")
          (align "center")
          (font "TeX")
          (linebreaks "false")
          (autonumber "AMS")
          (indent "0em")
         ;; (multlinewidth "85%")
          (tagindent ".8em")
          (tagside "right"))
        org-html-table-default-attributes
        '(:border "2"
                  :class "table table-striped table-sm table-bordered"
                  :cellspacing "0"
                  :cellpadding "6"
                  :rules "groups"
                  :frame "hsides")))
(after! org
  (setq org-export-backends '(ascii html latex md)
        org-export-async-debug t
        org-export-async-init-file (concat doom-private-dir "local/ox-init.el")
        org-publish-timestamp-directory (concat doom-cache-dir "/org-timestamps/")))

(use-package! htmlize
  :commands (htmlize-buffer
             htmlize-file
             htmlize-many-files
             htmlize-many-files-dired)
  :config
  (setq-default htmlize-pre-style t))
