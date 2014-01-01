;;; configure yasnippet
(require 'dropdown-list)
(require 'popup)
(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/my-snippets/"))
;(yas--initialize)
(yas-global-mode 1)
;(yas/reload-all)

(setq yas-prompt-functions '(yas-ido-prompt
			     yas-dropdown-prompt
			     yas-completing-prompt))

;; Jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)
(define-key yas-keymap (kbd "TAB") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "<tab>") 'yas-next-field-or-maybe-expand)

(add-hook 'yas/minor-mode-hook
	  (lambda () (define-key yas/minor-mode-map
		       (kbd "TAB") 'yas-next-field-or-maybe-expand)))

;; No need to be so verbose
;(setq yas-verbosity 1)

;; Wrap around region
(setq yas-wrap-around-region t)

;;; From http://iany.me/2012/03/use-popup-isearch-for-yasnippet-prompt/
;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
	(popup-make-item
	 (or (and display-fn (funcall display-fn choice))
	     choice)
	 :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t)))

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))

(provide 'setup-yasnippet)
;;; End of File

