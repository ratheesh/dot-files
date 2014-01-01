;;; configure yasnippet
(require 'dropdown-list)
(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/my-snippets"))
(yas--initialize)
(yas-global-mode 1)
(yas/reload-all)

(setq yas-prompt-functions '(yas-ido-prompt
			     yas-dropdown-prompt
			     yas-completing-prompt))

;; Jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)

;; No need to be so verbose
(setq yas-verbosity 1)

;; Wrap around region
(setq yas-wrap-around-region t)

(provide 'setup-yasnippet)
;;; End of File

