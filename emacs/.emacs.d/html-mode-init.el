;;; This is the initialization mode for html related packages

(use-package css-mode
  :ensure t
  )

(use-package css-eldoc
  :config
  (progn
    (turn-on-css-eldoc)))

;;; multi mode to edit different types of code in html file
(use-package multi-web-mode
  :config
  (progn
    (setq
     mweb-default-major-mode 'html-mode
     mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		 (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		 (css-mode "<style +type=\"text/css\"[^>]*>" "</style>"))
     mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
    (multi-web-global-mode 1)))

(provide 'html-mode-init)
;;; End of File
