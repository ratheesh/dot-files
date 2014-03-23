;;; configure yasnippet
(use-package dropdown-list)
(use-package popup)

(use-package yasnippet
  :config
  (progn 
    (setq yas-melpa-path (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
    (setq yas-snippet-dirs '())
    (add-to-list 'yas-snippet-dirs (expand-file-name "my-snippets" user-emacs-directory))
    (add-to-list 'yas-snippet-dirs yas-melpa-path)
    ;;(yas--initialize)
    (yas-global-mode 1)))
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

;(setq yas/triggers-in-field t); Enable nested triggering of snippets

;; Wrap around region
(setq yas-wrap-around-region t)

;;; From http://iany.me/2012/03/use-popup-isearch-for-yasnippet-prompt/
;; add some shortcuts in popup menu mode
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

;; Completing point by some yasnippet key
(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
  (let ((original-point (point)))
    (while (and
	    (not (= (point) (point-min)))
	    (not
	     (string-match "[[:space:]\n]" (char-to-string (char-before)))))
      (backward-word 1))
    (let* ((init-word (point))
	   (word (buffer-substring init-word original-point))
	   (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
		  (lambda (s) (string-match (concat "^" word) s)) list)))
	(if (= (length key) 1)
	    (setq key (pop key))
	  (setq key (ido-completing-read "key: " list nil nil word)))
	(delete-char (- init-word original-point))
	(insert key)
	        (yas-expand)))))
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-ido-expand)

(provide 'setup-yasnippet)
;;; End of File

