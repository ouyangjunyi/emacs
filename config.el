;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "ouyangjunyi"
      user-mail-address "zldark@126.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;;https://github.com/doomemacs/themes
(setq doom-theme 'doom-tokyo-night)
;;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;;(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq max-lisp-eval-depth 10000)

(setq url-proxy-services '(("http" . "127.0.0.1:10014")))
(setq url-proxy-services '(("https" . "127.0.0.1:10014")))


;;(use-package! org-html-themify
;;  :hook (org-mode . org-html-themify-mode)
;;  :custom
;;  (org-html-themify-themes
;;   '((dark . doom-one)
;;     (light . doom-one)))
;;  )

;;(use-package! org-html-themify
;;  :hook (org-mode . org-html-themify-mode)
;;  :custom
;;  (org-html-themify-themes
;;   '((dark . doom-one)
;;     (light . doom-one)))
;;  )

;; https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
(setq org-publish-project-alist
      '(
        ("org-inner"
         :base-directory "/home/oyjy/study/notes/inner/markdown_submodule"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :publishing-directory "/home/oyjy/org_publish/inner"
         )
        ("org-outer"
         :base-directory "/home/oyjy/study/notes/outer/markdown_submodule"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :publishing-directory "/home/oyjy/org_publish/outer"
         )
        ))

;;https://hsingko.github.io/post/emacs/?hmsr=joyk.com&utm_source=joyk.com&utm_medium=referral
;;valign-mode does not support org-columns
;;(add-hook 'org-mode-hook #'valign-mode)
;;(def-package! cnfonts)
;;(cnfonts-enable)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq doom-font
;;      (font-spec :family "Sarasa Mono SC Nerd" :size 10 :weight 'normal))
;;
;;(after! doom-big-font-mode
;;  (setq doom-font
;;        (font-spec :family "Sarasa Mono SC Nerd")))
;;
;;;; https://blog.csdn.net/xh_acmagic/article/details/78939246
;;(defun +my/better-font()
;;  (interactive)
;;  ;; english font
;;  (if (display-graphic-p)
;;      (progn
;;        (set-face-attribute 'default nil :font (format   "%s:pixelsize=%d" "Sarasa Mono SC Nerd" 18)) ;; 11 13 17 19 23
;;        ;; chinese font
;;        (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;          (set-fontset-font (frame-parameter nil 'font)
;;                            charset
;;                            (font-spec :family "Sarasa Mono SC Nerd")))) ;; 14 16 20 22 28
;;    ))
;;
;;(defun +my|init-font(frame)
;;  (with-selected-frame frame
;;    (if (display-graphic-p)
;;        (+my/better-font))))
;;
;;(if (and (fboundp 'daemonp) (daemonp))
;;    (add-hook 'after-make-frame-functions #'+my|init-font)
;;  (+my/better-font))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;; https://www.lujun9972.win/blog/2020/05/09/%E5%A6%82%E4%BD%95%E8%87%AA%E5%AE%9A%E4%B9%89org-mode%E4%B8%AD%E7%9A%84%E5%8A%A8%E6%80%81%E5%9D%97/index.html
(defun org-dblock-write:block-update-time (params)
  (let ((fmt (or (plist-get params :format) "%d. %m. %Y. %H:%M:%S")))
    (insert "Last block update at: "
            (format-time-string fmt))))

(defun org-update-time-dblock ()
  "Create a dynamic block capturing a column view table."
  (interactive)
  (org-create-dblock
   (list :name "block-update-time"))
  (org-update-dblock))


(eval-after-load 'org
                 '(progn
                    (org-dynamic-block-define "update-time" 'org-update-time-dblock)))

(after! org
 (setq org-log-done 'time)
 (setq org-todo-keywords
  '((sequence "TODO(t)"
      "DOING(i)"
      "PAUSE(p)"
      "PAUSE(s)"
      "DONE(d)"
      )))
  )

;; super agenda
;;
;;(use-package! org-super-agenda
;;  :after org-agenda
;;  :init
;;  (setq org-super-agenda-groups '((:name "Today"
;;                                   :time-grid t
;;                                   :scheduled today)
;;                                  (:name "Due Today"
;;                                   :deadline today)
;;                                  (:name "Important"
;;                                   :priority "A")
;;                                  (:name "Overdue"
;;                                   :deadline past)
;;                                  (:name "Due soon"
;;                                   :deadline future)
;;                                  (:name "Big Outcomes"
;;                                   :tag bo)))
;;  :config
;;  (org-super-agenda-mode))

;; treemacs
;;https://github.com/domtronn/all-the-icons.el
;;M-x all-the-icons-install-fonts
 (setq doom-themes-treemacs-theme "doom-colors")

(use-package! all-the-icons
  :if (display-graphic-p))
(defun doom*disable-all-the-icons-in-tty (orig-fn &rest args)
  (if (display-graphic-p)
      (apply orig-fn args)
    ""))
  


;; Example configuration for Consult
(use-package! consult
  :bind(
        ("C-c f" . consult-ripgrep)
        ("C-c P" . consult-find)
        )
  :config
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key '(:debounce 0.2 any)
   )
)

;; clipboard
(setq select-enable-clipboard nil)


(defun clipper()
  (interactive)
  (let ((xxx (get-register ?0)))
    (shell-command (format "echo %s | nc -N localhost 8377" (shell-quote-argument xxx)))
    (message "clipper")
    )
  )

(defun org-update-all-table-mine()
  (interactive)
  (org-update-all-dblocks)
  (org-ctrl-c-ctrl-c)
  )

;; custom-keymap
(map! :leader
      (:prefix-map ("\\" . "oyjy")
       (
        :desc "tabnine" "\\" #'company-tabnine
        )
       (
        :desc "clipper" "c" #'clipper
        )
       (:prefix ("h" . "highlight")
        :desc "on" "o" #'highlight-regexp
        :desc "off" "f" #'unhighlight-regexp
        )
       (:prefix ("o" . "orgmode")
        :desc "org-update-all-dblocks" "u" #'org-update-all-table-mine
        )
       ))

(remove-hook 'tty-setup-hook #'xterm-mouse-mode)


;;disable mouse
(global-disable-mouse-mode)
(mapc #'disable-mouse-in-keymap
  (list evil-motion-state-map
        evil-normal-state-map
        evil-visual-state-map
        evil-insert-state-map))

;; esc键位问题 https://emacs.stackexchange.com/questions/14755/how-to-remove-bindings-to-the-esc-prefix-key
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

 ;; :q should kill the current buffer rather than quitting emacs entirely
(evil-ex-define-cmd "q" 'delete-window)

(use-package evil
:bind (
       (:map evil-normal-state-map
             ("gt" . tab-next)
             ("gT" . tab-previous)
             ))
:config (evil-mode 1))

;; tabs c-x t
(define-key evil-window-map "T" 'tab-new)
(setq centaur-tabs-mode nil)

;;(global-visual-line-mode 0)
;;
;;(add-hook 'org-mode-hook
;;	  (lambda()
;;	    (setq truncate-lines nil)))

