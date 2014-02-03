;; common initialization

;;; Enable paredit (only for eLisp mode)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(when (require 'paredit nil 'noerror)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

;;ido mode
(when (require 'ido nil 'noerror)
  (ido-mode t)
  (ido-mode 'both) ;; for buffers and files
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
	'(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".mod" ".cmd")))

;; Try out flx-ido for better flex matching between words
(when (require 'flx-ido nil 'noerror)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-use-faces nil))

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
(when (require 'ido-at-point nil 'noerror)
  (ido-at-point-mode))

;;; configure yasnippet
(require 'setup-yasnippet nil 'noerror)

;;; Make all the themes safe by default
(setq custom-safe-themes t)

;;smex
(when (require 'smex nil 'noerror)
  (smex-initialize))

;;; Enable footnote mode for text files
(when (require 'footnote nil 'noerror)
  (add-hook 'text-mode-hook 'footnote-mode))

;;; call footnote-init when entering footnote mode for realligning
;;; across sessions
(when (require 'footnote-init nil 'noerror)
  (add-hook 'footnote-mode-hook 'footnote-init))

;; smart mode line
(when (require 'smart-mode-line nil 'noerror)
  (sml/setup))

;;; smart tab
;(require 'smart-tab)

;; cleanup after git commit is over
(add-hook 'server-switch-hook
  (lambda ()
    (menu-bar-mode -1)))
(add-hook 'server-done-hook (lambda nil (kill-buffer nil)))

(when (require 'fringe-current-line nil 'noerror)
  (global-fringe-current-line-mode 1))	;enable to all buffers by default

;(setq-default indicate-buffer-boundaries 'left)
;(setq-default indicate-empty-lines +1)

;;; hungry-delete
(when (require 'hungry-delete nil 'noerror)
  (add-hook 'prog-mode
	    (lambda () (global-hungry-delete-mode))))

;;; ack-and-half - alternative for grep
(when (require 'ack-and-a-half)
  (defalias 'ack 'ack-and-a-half)
  (defalias 'ack-same 'ack-and-a-half-same)
  (defalias 'ack-find-file 'ack-and-a-half-find-file)
  (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same))

(require 'iy-go-to-char nil 'noerror)
(require 'isearch-symbol-at-point nil 'noerror)

;;; license management
(require 'xlicense nil 'noerror)
(require 'lice nil 'noerror)

(provide 'common-init)
