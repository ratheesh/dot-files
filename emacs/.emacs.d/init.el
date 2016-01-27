;;-*-Emacs-Lisp-*-
;; init.el
;; Ratheesh S
;; April 2015
;; Some stuff is taken from http://www.dgp.toronto.edu/~ghali/emacs.html
;; Based on magnar's https://github.com/magnars/.emacs.d
;; Special thanks to santosh sivaraj

; Meine Emacs Einstellungen

;;; enable debugging in case there are errors during emacs init
(setq debug-on-error t)

;;; save the current time
(defconst emacs-start-time (current-time))

;; This file does not work with XEmacs.
(when (featurep 'xemacs)
  (error "This .emacs file does not work with XEmacs."))

;;; Disable Cursor blinking
(blink-cursor-mode (- (*) (*) (*)))

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
       (set-default-font "MonacoB-13:weight=normal:slant=Oblique")
       (setq default-frame-alist '((font . "MonacoB-13:weight=thin:slant=Oblique")))
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
			 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

;; Check if we're on Emacs 24.4 or newer, if so, use the pinned package feature
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
                '((smex               . "melpa-stable")
                  (helm               . "melpa-stable")
                  (yasnippet          . "melpa-stable")
		  (magit              . "melpa-stable")
                  ;; "unstable" package
                  (icicles            . "melpa"))))
(package-initialize)

; fetch the list of packages available
(when (not package-archive-contents)
    (package-refresh-contents))

;;; install use-package - this is required for all other packages.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(require 'use-package)

(setq load-prefer-newer t)

(use-package sane-defaults)
(use-package my-defuns)
(use-package helm-mode-config)
(use-package common-init)
(use-package git-mode-init)
(use-package mode-mappings)
(use-package prog-mode-init)
(use-package cc-mode-init)
(use-package setup-yasnippet)
(use-package python-mode-init)
(use-package html-mode-init)
(use-package org-init)
(use-package key-bindings)
(use-package appearance)
(use-package misc-config)

;;; Load user initialization code
(load user-file 'noerror)

;; Load custom.el now to avoid any unwanted setting overwrites
(load custom-file 'noerror)

;;; Start Emacs Server
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;;; print time taken for emacs to startup!
(let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
  (message "Loading init.el took %.3f seconds!!!" elapsed))

;;; disable debugging
(setq debug-on-error nil)
;; End of the File
