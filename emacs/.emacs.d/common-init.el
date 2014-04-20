;; common initialization

;;; Enable paredit (only for eLisp mode)
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(use-package paredit
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
    (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
    (add-hook 'scheme-mode-hook           #'enable-paredit-mode)))

;;ido mode
(use-package ido
  :init
  (progn 
    (ido-mode t)
    (ido-mode 'both))) ;; for buffers and files
  
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 50
      resize-mini-windows 'grow-only
      max-mini-window-height 0.5
      completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".mod" ".cmd"))

;; Try out flx-ido for better flex matching between words
(use-package flx-ido
  :init
  (progn 
    (flx-ido-mode 1)
    ;; disable ido faces to see flx highlights.
    (setq ido-use-faces nil)))

;; flx-ido looks better with ido-vertical-mode
;; (when (require 'ido-vertical-mode nil 'noerror)
;;   (ido-vertical-mode))

(defun sd/ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

;; Ido at point (C-,)
(use-package ido-at-point
  :init
  (progn 
    (ido-at-point-mode)))

;;; Make all the themes safe by default
(setq custom-safe-themes t)

;;smex
(use-package smex
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ("C-c C-c M-x" . execute-extended-command))
  :init
  (progn 
    (smex-initialize)))

;;; Enable footnote mode for text files
(use-package footnote
  :init
  (progn 
    (add-hook 'text-mode-hook 'footnote-mode)))

;;; call footnote-init when entering footnote mode for realligning
;;; across sessions
(use-package footnote-init
  :disabled t
  :init
  (progn 
    (add-hook 'footnote-mode-hook 'footnote-init)))

;; smart mode line
(use-package smart-mode-line
  :init
  (progn
    (setq sml/vc-mode-show-backend t)
    (sml/setup)
    (sml/apply-theme 'respectful)))

;;; smart tab
;(use-package 'smart-tab)

(use-package fringe-current-line
  :disabled t
  :init
  (progn 
    (global-fringe-current-line-mode 1))) ;enable to all buffers by default

;(setq-default indicate-buffer-boundaries 'left)
;(setq-default indicate-empty-lines +1)

;;; hungry-delete
(use-package hungry-delete
  :init
  (progn 
    (add-hook 'prog-mode
	      (lambda () (global-hungry-delete-mode)))))

;;; ack-and-half - alternative for grep
(use-package ack-and-a-half
  :bind
  (("<f9>" . ack))
  :init
  (progn 
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))

(use-package iy-go-to-char
  :bind
  (("C-c f" . iy-go-to-char)
   ("C-c F" . iy-go-to-char-backward)
   ("C-c ," . iy-go-to-or-up-to-continue)))

(use-package isearch-symbol-at-point
  :bind
  (("M-s s" . isearch-symbol-at-point)))

;;; managing of register in a better way
(use-package iregister
  :bind
  (("M-n" . iregister-jump-to-next-marker)
   ("M-p" . iregister-jump-to-previous-marker)
   ("M-u" . iregister-point-or-text-to-register)
   ("M-l" . iregister-text)))

;;; license management
(use-package xlicense)
(use-package lice)

;;; simplenote - note taking app for smartphones
(use-package simplenote :defer t)

;;; configure yasnippet - this is called from setup-yasnippet.el
(use-package setup-yasnippet)

(provide 'common-init)
