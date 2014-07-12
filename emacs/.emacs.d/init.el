;;-*-Emacs-Lisp-*-
;; init.el
;; Ratheesh S
;; Feb 2014
;; Some stuff is taken from http://www.dgp.toronto.edu/~ghali/emacs.html
;; Based on magnar's https://github.com/magnars/.emacs.d
;; Special thanks to santosh shivraj

; Meine Emacs Einstellungen

;;; save the current time
(defconst emacs-start-time (current-time))

;; This file does not work with XEmacs.
(when (featurep 'xemacs)
  (error "This .emacs file does not work with XEmacs."))

;; get the system type
(defvar system-type-as-string (prin1-to-string system-type))

(defvar on_windows_nt (string-match "windows-nt" system-type-as-string))
(defvar on_darwin     (string-match "darwin" system-type-as-string))
(defvar on_gnu_linux  (string-match "gnu/linux" system-type-as-string))

(defvar set-default-font "Inconsolata-14")
;; set the default font and size
(cond (on_darwin
       (set-default-font "Monaco-16")
       (setq default-frame-alist '((font . "Monaco-16")))
        ))

(cond (on_gnu_linux
       (set-default-font "Inconsolata-16")
       (setq default-frame-alist '((font . "Inconsolata-16")))
       ;; (set-default-font "12x24")
       ))

(cond (on_windows_nt
       (set-default-font "Lucida Console-11")
       (setq default-frame-alist '((font . "Lucida Console-11")))
       ))

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq user-file (expand-file-name "user-init.el" user-emacs-directory))
;(load custom-file 'noerror)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'package)
(require 'cl)

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

; fetch the list of packages available
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar packages-list '(
    whitespace fill-column-indicator paredit dropdown-list popup telepathy
    highlight-parentheses c-eldoc emamux figlet auto-complete autopair
    auto-complete-clang rainbow-mode rainbow-delimiters ace-jump-mode lice
    smart-mode-line ido-vertical-mode magit key-chord smartparens diminish
    expand-region smart-operator smart-newline duplicate-thing multiple-cursors
    smex smooth-scrolling undo-tree yasnippet ecb smart-forward scratch-ext
    org-bullets git-gutter+ git-gutter-fringe+ xclip sudo-ext iy-go-to-char
    isearch-symbol-at-point idomenu ido-at-point emacs-setup boxquote
    git-commit-training-wheels-mode flx-ido jump-char smart-tab unicode-fonts
    sr-speedbar ggtags fringe-current-line git-messenger stgit hlinum simplenote
    use-package hungry-delete gitconfig-mode gitignore-mode iregister css-eldoc
    flymake-css multi-web-mode)
  "List of packages needs to be installed at launch")

(defun has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

;;; make sure that use-package is initialized first before other
;;; package to make sure that package are properly initialized
(when (require 'use-package nil 'noerror)
  (setq use-package-idle-interval 2)
  (setq use-package-verbose t))

;;; setup el-get related packages
(use-package el-get-init :defer t)

(use-package sane-defaults)
(use-package common-init)
(use-package git-mode-init)
(use-package mode-mappings)
(use-package cc-mode-init)
(use-package html-mode-init)
(use-package org-init)
(use-package my-defuns)
(use-package key-bindings)
(use-package appearance)

;;; Load user initialization code
(load user-file 'noerror)

;; Load custom.el now to avoid any unwanted setting overwrites
(load custom-file 'noerror)

;;; print time taken for emacs to startup!
(let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
  (message "Loading init.el took %.3f seconds!!!" elapsed))

;; End of the File
