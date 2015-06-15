;; common initialization

;;; paradox package management
(use-package paradox
  :ensure t
  :init
  (progn
    (setq paradox-execute-asynchronously t))
  :config
  (progn
    (paradox-enable)))

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

;;; enable narrow-to-region functionality which disabled by default
(put 'narrow-to-region 'disabled nil)

;; Try out flx-ido for better flex matching between words
(use-package flx-ido
  :ensure t
  :init
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    (setq ido-enable-flex-matching t)))

;; Ignore extensions in completion
(setq completion-ignored-extensions
      '(".o" ".lo" ".mh" ".elc" "~"
	".bin" ".lbin" ".fasl" ".dvi" ".toc"   ".aux" ".lof" ".blg" ".bbl"
	".glo" ".idx" ".lot"))
(setq ido-ignore-extensions t)

;; flx-ido looks better with ido-vertical-mode
(use-package ido-vertical-mode
  :ensure t
  :disabled t
  :config
  (progn
    (ido-vertical-mode)))

(defun sd/ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

;; Ido at point (C-,)
(use-package ido-at-point
  :ensure t
  :defer t
  :init
  (progn
    (ido-at-point-mode)))

;;; Make all the themes safe by default
(setq custom-safe-themes t)

;;smex
(use-package smex
  :ensure t
  :disabled t
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ("C-c C-c M-x" . execute-extended-command))
  :init
  (progn
    (smex-initialize)))

;;; Enable footnote mode for text files
(use-package footnote
  :defer t
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

(use-package fringe-current-line
  :ensure t
  :disabled t
  :init
  (progn
    (global-fringe-current-line-mode 1))) ;enable to all buffers by default

;;; ack-and-half - alternative for grep
(use-package ack-and-a-half
  :disabled t
  :bind
  (("<f9>" . ack))
  :init
  (progn
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))

(use-package iy-go-to-char
  :ensure t
  :defer t
  :bind
  (("C-c f" . iy-go-to-char)
   ("C-c F" . iy-go-to-char-backward)
   ("C-c ," . iy-go-to-or-up-to-continue)))

(use-package isearch-symbol-at-point
  :ensure t
  :defer t
  :bind
  (("M-s s" . isearch-symbol-at-point)))

;;; managing of register in a better way
(use-package iregister
  :ensure t
  :bind(
	("<f3>" . iregister-point-to-register)
	("M-p" . iregister-jump-to-next-marker))
  )

;;; fasd
(use-package fasd
  :ensure t
  :bind
  (("C-h C-/" . fasd-find-file))
  :init
  (progn
    (global-fasd-mode 1)
    (setq fasd-enable-initial-prompt 'nil)))

;;; simplenote - note taking app for smartphones
(use-package simplenote :ensure t :defer t)

;; flx-isearch
(use-package flx-isearch
  :ensure t
  :demand t
  :defer t
  :bind
  (("C-M-s" . flx-isearch-forward)
   ("C-M-r"  . flx-isearch-backward)))

;;; swoop
(use-package helm-swoop
  :ensure t
  :demand t
  :defer t
  :bind
  (("<f4>" . helm-swoop))
  :init
  (progn
    (setq helm-swoop-split-with-multiple-windows nil)
    (setq helm-swoop-split-direction 'split-window-horizontally)
    (setq helm-swoop-speed-or-color nil)
    (setq helm-swoop-move-to-line-cycle t)
    (setq helm-swoop-use-line-number-face t)))

;;; auto update of packages
(use-package auto-package-update :ensure t)

(use-package with-editor
  :defer t
  :ensure t
  :init
  (progn
    (add-hook 'shell-mode-hook  'with-editor-export-editor)
    (add-hook 'eshell-mode-hook 'with-editor-export-editor)))

;;; ace-jump mode - keybinding as a part of keychord package config
(use-package ace-jump-mode
  :ensure t
  :config
  (setq ace-jump-mode-submode-list
        '(ace-jump-char-mode
          ace-jump-word-mode
          ace-jump-line-mode)))

;;; smart mode line with powerline
(use-package smart-mode-line
  :ensure t
  :init
  (progn
    (setq
     sml/vc-mode-show-backend t
     sml/theme 'dark
     sml/shorten-modes t
     sml/name-width 32
     sml/shorten-directory t)
    :config
    (progn
      (use-package powerline
	:init
	(progn
	  (powerline-center-theme))))
    (add-hook 'after-init-hook 'sml/setup)))

;;; navigate through emacs-mark ring
(use-package show-marks
  :ensure t
  :bind (
	 ("M-n" . forward-mark)
	 ("M-l" . show-marks)))

(use-package back-button
  :commands back-button-mode
  :disabled t
  :diminish back-button-mode
  :bind (
	 ("<f2>" . back-button-push-mark-local-and-global)
	 ("M-u" . back-button-global-backward)
	 ("M-l" . back-button-global-forward)
	 ("M-p" . back-button-local-backward)
	 ("M-n" . back-button-local-forward))
  :init
  (progn
    (use-package smartrep
      :ensure t )
    (use-package visible-mark
      :disabled t))
  :config
  (progn
    (back-button-mode 1)))

;;; highlight operation of library visually
(use-package volatile-highlights
  :ensure t
  :commands volatile-highlights-mode
  :diminish volatile-highlights-mode
  :config
  (progn
    (volatile-highlights-mode)))

(use-package smart-tab
  :ensure t
  :defer t
  :diminish ""
  :init (global-smart-tab-mode 1)
  :config
  (progn
    (add-to-list 'smart-tab-disabled-major-modes 'mu4e-compose-mode)
    (add-to-list 'smart-tab-disabled-major-modes 'erc-mode)
    (add-to-list 'smart-tab-disabled-major-modes 'shell-mode)))

(use-package idomenu
  :ensure t
  :disabled t
  :bind
  (("M-i" . idomenu)))

(use-package duplicate-thing
  :ensure t
  :bind (("C-c d" . duplicate-thing)))

(use-package boxquote :ensure t)

(use-package swiper-helm
  :ensure t
  :bind
  (("C-s" . swiper-helm)
   ("C-r" . swiper-helm)))

;;; visually zap to the char
(use-package zop-to-char
  :ensure t
  :bind (
	 ("M-z" . zop-up-to-char)))

(provide 'common-init)
