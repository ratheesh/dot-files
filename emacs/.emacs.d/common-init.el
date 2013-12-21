;; common initialization

;;ido mode
(require 'ido)
(ido-mode t)
(ido-mode 'both) ;; for buffers and files
(setq ido-enable-flex-matching t)
(setq resize-mini-windows 'grow-only)
(setq max-mini-window-height 0.5)
(setq ido-enable-flex-matching t)
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".mod" ".cmd"))

;;smex
(require 'smex)
(smex-initialize)

;; smart mode line
(require 'smart-mode-line)
(setq sml/theme 'light)
(sml/setup)

(provide 'common-init)
