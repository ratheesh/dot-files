;;-*-Emacs-Lisp-*-
;; .emacs
;; Ratheesh
;; October 2013
;; some stuff is taken from http://www.dgp.toronto.edu/~ghali/emacs.html
;; Special thanks to santosh shivraj

; Meine Emacs Einstellungen
;; This file does not work with XEmacs.
(when (featurep 'xemacs)
  (error "This .emacs file does not work with XEmacs."))

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;save all my local customization to a seperate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq package-list '(identica-mode dropdown-list whitespace tramp
      fill-column-indicator icicles hl-line+ bookmark+
       org paredit highlight-parentheses c-eldoc
       auto-complete autopair auctex auto-complete-clang sr-speedbar
       rainbow-mode rainbow-delimiters ace-jump-mode smart-mode-line
       ido-vertical-mode org-gnome figlet magit ))

(defun check-and-install (list)
  (let (v)
    (dolist (p list v)
      (if (not (package-installed-p p))
          (package-install p))))
  (message "Package check and installation done."))

(package-initialize)
(check-and-install package-list)

(load "~/.emacs.d/init.el")
(load-file "~/.emacs.d/lisp/ido-goto-symbol.el")

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'smart-mode-line)
(setq sml/theme 'dark)
(add-to-list 'sml/replacer-regexp-list '("^/home/ratheesh" ":HOME:"))
(sml/setup)

;(require 'icicles)
;(icy-mode 1)
