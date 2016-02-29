;; configure prog mode

;;; show trailing white spaces by default
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;;; common env
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'prog-mode-hook 'set-newline-and-indent)

;; enable clean-aindent-mode for programming mode
;; (add-hook 'prog-mode-hook 'clean-aindent-mode)

;;; enable fill column indicator
;; (add-hook 'prog-mode-hook 'spacemacs/toggle-fill-column-indicator-on)
