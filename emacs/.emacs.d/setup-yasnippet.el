;;; configure yasnippet

(use-package yasnippet
  :ensure t
  :pin melpa-stable
  :diminish yas-minor-mode
  :init
  (progn 
    (setq yas-melpa-path (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
    (setq yas-snippet-dirs '())
    (add-to-list 'yas-snippet-dirs (expand-file-name "my-snippets" user-emacs-directory))
    (add-to-list 'yas-snippet-dirs yas-melpa-path)
    (setq  yas-wrap-around-region t))
  :config
  (progn
    (yas-global-mode 1)))

;;; dropdown prompt is annoying! So disable that.
(setq yas-prompt-functions '(yas-ido-prompt
			     yas-completing-prompt))

;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)

(provide 'setup-yasnippet)
;;; End of File

