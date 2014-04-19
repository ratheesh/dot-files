;;; This is the initialization mode for html related packages

(use-package css-mode
  :ensure t
  )

(use-package css-eldoc
  :config
  (progn
    (turn-on-css-eldoc)))

(provide 'html-mode-init)
;;; End of File
