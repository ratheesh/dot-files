;;; Python mode setup

(use-package python
  :init
  (progn
    (setq python-indent-offset 4)))

;;; set env for python - python2 for now!
(setenv "PYTHONPATH" "/usr/bin/python")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; (add-hook 'python-mode-hook 'jedi:ac-setup)

(use-package pymacs
  :init
  (pymacs-load "ropemacs" "rope-"))

(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
      (lambda ()
	(add-to-list 'ac-sources 'ac-source-ropemacs)))

(add-hook 'python-mode-hook 'auto-complete-mode)

;;; elpy configuration
(use-package elpy
  ;; :disabled t
  :init
  (progn
    (elpy-enable)
    (elpy-clean-modeline)
    (setq elpy-rpc-backend "rope")
    (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
    (define-key global-map (kbd "C-c o") 'iedit-mode)))

(provide 'python-mode-init)
;;; End of File
