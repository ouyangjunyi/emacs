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
(setq display-line-numbers-type t)

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

;; (setq url-proxy-services '(("http" . "127.0.0.1:10014")))
;; (setq url-proxy-services '(("https" . "127.0.0.1:10014")))
;;


(use-package! org-html-themify
  :hook (org-mode . org-html-themify-mode)
  :custom
  (org-html-themify-themes
   '((dark . doom-one)
     (light . doom-one)))
  )

(setq org-publish-project-alist
      '(
        ("init"
         :base-directory "~/tempo/orgmode"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/tempo/public"
         )
        ))

;;https://hsingko.github.io/post/emacs/?hmsr=joyk.com&utm_source=joyk.com&utm_medium=referral
;;valign-mode does not support org-columns
(add-hook 'org-mode-hook #'valign-mode)
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

