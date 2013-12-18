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

(setq package-list '(identica-mode dropdown-list whitespace
                     cedit fill-column-indicator icicles hl-line+
                     paredit highlight-parentheses c-eldoc emamux figlet
                     auto-complete autopair auctex auto-complete-clang
                     rainbow-mode rainbow-delimiters ace-jump-mode
                     smart-mode-line ido-vertical-mode org-gnome figlet magit
                     autopair auto-auto-indent key-chord expand-region
                     smart-operator smart-newline duplicate-thing multiple-cursors
 ))

(defun check-and-install (list)
  (let (v)
    (dolist (p list v)
      (if (not (package-installed-p p))
          (package-install p))))
  (message "Package check and installation done."))

(check-and-install package-list)

(load "~/.emacs.d/init.el")

;; End of File

