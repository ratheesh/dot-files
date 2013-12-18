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
              B
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
                         (string-match (expand-file-name "~/.")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))

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

;; smart operator - really smart!
(require 'smart-operator)
(defun my-c-mode-common-hook()
  (smart-insert-operator-hook)

  (local-unset-key (kbd "."))
  (local-unset-key (kbd ":"))
  (local-set-key (kbd "*") 'c-electric-star))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


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
 
;;paredit - use it wth care!!!
(defvar electrify-return-match
  "[\]}\)\"]"
      "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
      "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
      (interactive "P")
      (let ((case-fold-search nil))
        (if (looking-at electrify-return-match)
            (save-excursion (newline-and-indent)))
        (newline arg)
        (indent-according-to-mode)))

;; Using local-set-key in a mode-hook is a better idea.
(global-set-key (kbd "RET") 'electrify-return-if-match)

