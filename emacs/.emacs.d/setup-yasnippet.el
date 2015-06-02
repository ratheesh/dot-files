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
    (setq yas-triggers-in-field t)
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

;;; company and yasnippet
;; (defun check-expansion ()
;;     (save-excursion
;;       (if (looking-at "\\_>") t
;;         (backward-char 1)
;;         (if (looking-at "\\.") t
;;           (backward-char 1)
;;           (if (looking-at "->") t nil)))))

;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas-expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;; 	    (null (do-yas-expand)))
;; 	(if (check-expansion)
;; 	    (company-complete-common)
;; 	  (indent-for-tab-command)))))

;; (global-set-key [tab] 'tab-indent-or-complete)

(provide 'setup-yasnippet)
;;; End of File
