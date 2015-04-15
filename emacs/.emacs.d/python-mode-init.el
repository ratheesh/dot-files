;;; Python mode setup

(use-package python
  :init
  (progn
    (setq python-indent-offset 4)))

;;; set env for python - python2 for now!
(setenv "PYTHONPATH" "/usr/bin/python")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(use-package pymacs
  ;; :ensure t
  :config
  (progn
    (pymacs-load "ropemacs" "rope-")))

(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
      (lambda ()
	(add-to-list 'ac-sources 'ac-source-ropemacs)))

(add-hook 'python-mode-hook 'auto-complete-mode)

;;; elpy configuration
(use-package elpy
  :ensure t
  :init
  (progn
    (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
    (define-key global-map (kbd "C-c o") 'iedit-mode))
  :config
  (progn
    (elpy-enable)
    (setq elpy-rpc-backend "rope")))

;;; customize color for highlight-indentation face
(use-package highlight-indentation
  :ensure t
  :config
  (progn
    (set-face-background 'highlight-indentation-face "#2f4f4f")
    (set-face-background 'highlight-indentation-current-column-face "#2f4f4f")))

;;; configure flymake-python-pyflakes
(use-package flymake-python-pyflakes
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)))

(provide 'python-mode-init)
;;; End of File
