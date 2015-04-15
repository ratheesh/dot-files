;;; configure yasnippet

(use-package yasnippet
  :ensure t
  :pin melpa-stable
  :init
  (progn 
    (setq yas-melpa-path (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
    (setq yas-snippet-dirs '())
    (add-to-list 'yas-snippet-dirs (expand-file-name "my-snippets" user-emacs-directory))
    (add-to-list 'yas-snippet-dirs yas-melpa-path))
  :config
  (progn
    (yas-global-mode 1)))

(setq yas-prompt-functions '(yas-ido-prompt
			     yas-dropdown-prompt
			     yas-completing-prompt))

(provide 'setup-yasnippet)
;;; End of File

