;; -*- Mode: Lisp -*-
(provide 'package)
;; Required packages
(require 'cc-mode)
(require 'autopair)
(require 'yasnippet-bundle)
(require 'fill-column-indicator)
(require 'rainbow-delimiters)
(require 'xcscope)
(require 'whitespace)
(require 'auto-complete-config)
;(require 'dtrt-indent)
(require 'ecb)
;(require 'ecb-autoloads)

(setq
 c-default-style "linux"
 autopair-autowrap t
 cscope-do-not-update-database t
 whitespace-style '(face lines-tail trailing empty space-before-tab)
)

(setq-default
 c-basic-offset 8
 c-default-style "linux"
 tab-width 8
 indent-tabs-mode t
 fci-rule-column 80
;show-trailing-whitespace t
)

(autopair-global-mode 1)
(global-rainbow-delimiters-mode)
;(yas-global-mode 1)

;;fci-column-indicator mode
(setq
 fci-handle-truncate-lines nil
 fci-rule-width 1
 fci-rule-color "cyan"
)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode 1)
(defun auto-fci-mode (&optional unused)
(if (> (window-width) fci-rule-column)
      (fci-mode 1)
      (fci-mode 0))
)

(electric-indent-mode 1)

(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)
(add-hook 'c-mode-common-hook 'fci-mode)
(add-hook 'c-mode-common-hook
            (lambda ()
            (font-lock-add-keywords nil
            '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

(add-hook 'makefile-mode-hook 
  (lambda()
    (setq show-trailing-whitespace t)))

(add-hook 'c-mode-common-hook
  (lambda()
    (dtrt-indent-mode t)))

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 
   '(lambda () 
      (whitespace-toggle-options t)
))

;; Auto complete configuration
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode 'set-newline-and-indent)

(add-hook 'c-mode-common-hook 
  (lambda ()
    (which-function-mode t)))

;(load "gtags.el" nil t t)
;(add-hook 'gtags-mode-hook 
;	  '(lambda () 
;	     (require 'gtags)
;	     (gtags-mode t)))

;(autoload 'gtags-mode "gtags" "" t)

(defun duplicate-current-line ()
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))
(global-set-key "\C-cd" 'duplicate-current-line)

;; ECB env settings


(setq
 ecb-layout-name "rathy-dh-layout"
 ecb-show-sources-in-directories-buffer 'always
 ecb-compile-window-height nil
)

;;; activate and deactivate ecb
(global-set-key "\C-c(" 'ecb-activate)
(global-set-key "\C-c)" 'ecb-deactivate)
;;; show/hide ecb window
;(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
;(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key "\C-c1" 'ecb-goto-window-edit1)
(global-set-key "\C-c2" 'ecb-goto-window-directories)
(global-set-key "\C-c3" 'ecb-goto-window-history)
;(global-set-key "\C-c4" 'ecb-goto-window-sources)
;(global-set-key "\C-c5" 'ecb-goto-window-methods)
;(global-set-key "\C-c6" 'ecb-goto-window-compilation)
 

; Tex env settings

(load "auctex-pkg.el" nil t t)


