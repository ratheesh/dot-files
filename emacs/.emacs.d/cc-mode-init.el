;; -*- Mode: Lisp -*-

;; Required packages
(require 'cc-mode nil 'noerror)
(require 'autopair nil 'noerror)
(require 'xcscope nil 'noerror)
(require 'whitespace nil 'noerror)
(require 'auto-complete-config nil 'noerror)
(require 'ecb nil 'noerror)
(require 'magit nil 'noerror)
(require 'sr-speedbar nil 'noerror)
(require 'ggtags nil 'noerror)

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

(when (require 'rainbow-delimiters nil 'noerror)
  (global-rainbow-delimiters-mode))

;;fci-column-indicator mode
(when (require 'fill-column-indicator nil 'noerror)
  (setq
   fci-handle-truncate-lines nil
   fci-rule-width 1
   fci-rule-color "#404040"
   )
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1))))

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

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
;(add-hook 'c-mode-common-hook 'smart-tab-mode)
(add-hook 'c-mode-hook
   '(lambda ()
      (whitespace-toggle-options t)
))

(add-hook 'c-mode-common-hook
          #'(lambda ()
            (setq autopair-dont-activate t)
            (autopair-mode -1)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

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

;; ;; Auto complete configuration
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;(setq ac-source-yasnippet nil)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-hook 'set-newline-and-indent)

(add-hook 'c-mode-common-hook
  (lambda ()
    (which-function-mode t)))

;;; highlight format specifiers in *printf functions in c-mode
(defvar font-lock-format-specifier-face 'font-lock-format-specifier-face
  "Face name to use for format specifiers.")

(defface font-lock-format-specifier-face
  '((t (:foreground "#ff00ff")))
  "Font Lock mode face used to highlight format specifiers."
  :group 'font-lock-faces)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("[^%]\\(%\\([[:digit:]]+\\$\\)?[-+' #0*]*\\([[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)\\(\\.\\([[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)\\)?\\([hlLjzt]\\|ll\\|hh\\)?\\([aAbdiuoxXDOUfFeEgGcCsSpn]\\|\\[\\^?.[^]]*\\]\\)\\)"
				       1 font-lock-format-specifier-face t)
				      ("\\(%%\\)"
				       1 font-lock-format-specifier-face t)) )))

;;key chord config
(when (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define c-mode-map ";;" "\C-e")) ;end of the line

;; smart operator - really smart!
;; (require 'smart-operator nil 'noerror)
;; (defun my-c-mode-common-hook()
;;  (smart-insert-operator-hook)
;;  (local-unset-key (kbd "."))
;;  (local-unset-key (kbd ":"))
;;  (local-unset-key (kbd "%"))
;;  (local-set-key (kbd "*") 'c-electric-star))
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; ECB env settings
(setq
 ecb-layout-name "rathy-dh-layout"
 ecb-show-sources-in-directories-buffer 'always
 ecb-compile-window-height nil
)

(provide 'cc-mode-init)
