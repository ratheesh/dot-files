;; cc-mode configuration

;; Required packages
(use-package cc-mode)
(use-package autopair)
(use-package xcscope :disabled t)
(use-package whitespace)
(use-package auto-complete-config)

(setq
  c-basic-offset 8
  tab-width 8
  indent-tabs-mode t)

;;; make parenthesis colorful!
(use-package rainbow-delimiters)

(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
      (fci-mode 1)
    (fci-mode 0))
  )

;;fci-column-indicator mode
(use-package fill-column-indicator
  :config
  (progn 
    (setq
     fci-handle-truncate-lines nil
     fci-rule-width 1
     fci-rule-color "#71a19f")
    (setq-default  fci-rule-column 80)
    (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
    (add-hook 'after-change-major-mode-hook 'auto-fci-mode)
    (add-hook 'window-configuration-change-hook 'auto-fci-mode)))

;; (electric-indent-mode 1)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq
	     fci-rule-column 80
	     show-trailing-whitespace)
	    (rainbow-delimiters-mode)
	    (fci-mode)
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
	    (font-lock-add-keywords nil
				    '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))
	    (flyspell-prog-mode)
	    (which-function-mode t)))

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (helm-gtags-mode 1))))

;;From Linux source
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "/")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))

(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; complete configuration
(use-package auto-complete-config
  :config
  (progn 
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
    (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
    (ac-config-default)
    (setq ac-auto-show-menu nil)
    (ac-set-trigger-key "TAB")
    (ac-set-trigger-key "<tab>")))

;;key chord config
(use-package key-chord
  :config
  (progn 
    (key-chord-mode 1)
    (key-chord-define-global "jj" 'ace-jump-word-mode) ;ace jump mode
    (key-chord-define c-mode-map ";;" "\C-e")) ;end of the line
  )

;;; kconfig mode configuration
(use-package kconfig-mode)

;;; dts file editing
(use-package dts-mode :ensure t)

;;; gtags configuration
(use-package ggtags :ensure t :disabled t)

;;; helm-gtags
(use-package helm-gtags
  :pin melpa-stable
  :ensure t
  :diminish helm-gtags-mode
  :bind
  (("<f7>" . helm-gtags-dwim)
   ("<f8>" . helm-gtags-pop-stack))
  :config
  (progn
    (setq
     helm-gtags-ignore-case t
     helm-gtags-auto-update t
     helm-gtags-pulse-at-cursor t
     helm-gtags-use-input-at-cursor t
     helm-gtags-display-style 'detail
     helm-gtags-highlight-candidate t)
    ))

(use-package magit
  :defer t
  :ensure t
  :bind
  (("C-x g" . magit-status)))

;; ECB env settings
(use-package ecb
  :defer t
  :bind
  (("\C-c(" . ecb-activate)
   ("\C-c)" . ecb-deactivate)
   ("\C-c1" . ecb-goto-window-edit1)
   ("\C-c2" . ecb-goto-window-directories)
   ("\C-c3" . ecb-goto-window-history))
  :config
  (progn 
    (setq
     ecb-layout-name "rathy-dh-layout"
     ecb-show-sources-in-directories-buffer 'always
     ecb-compile-window-height nil)))

(use-package sr-speedbar
  :defer t
  :bind
  (("C-c C-s" . sr-speedbar-toggle)))

(use-package company
  :ensure t
  :commands global-company-mode
  :init (progn
          (global-company-mode)
          (setq company-global-modes '(not python-mode cython-mode sage-mode)))
  :config (progn
            (setq company-tooltip-limit 20
		  company-idle-delay .3
		  company-echo-delay 0
		  company-begin-commands '(self-insert-command))))

(provide 'cc-mode-init)
