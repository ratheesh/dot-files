;;; Python mode setup

(use-package python
  :commands python-mode
  :config
  (progn
    (define-key python-mode-map (kbd "C-c C-z") 'run-python)
    (define-key python-mode-map (kbd "<backtab>") 'python-back-indent)
    (defun my/setup-jedi ()
      (interactive)
      (use-package jedi
	:ensure t
        :config
        (progn
          (jedi:setup)
          (jedi:ac-setup)
          (setq jedi:setup-keys t)
          (setq jedi:complete-on-dot t)
          (define-key python-mode-map (kbd "C-c C-d") 'jedi:show-doc)
          (setq jedi:tooltip-method nil)
          (set-face-attribute 'jedi:highlight-function-argument nil
                              :foreground "green")
          (define-key python-mode-map (kbd "C-c C-l") 'jedi:get-in-function-call))))
    (add-hook 'python-mode-hook #'my/setup-jedi)))

;;; set env for python - python2 for now!
(setenv "PYTHONPATH" "/usr/bin/python")

(use-package pymacs
  ;; :ensure t
  :config
  (progn
    (pymacs-load "ropemacs" "rope-")))

;;; elpy configuration
(use-package elpy
  :ensure t
  :diminish elpy-mode
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
    (set-face-background 'highlight-indentation-current-column-face "#2f4f4f")
    (add-hook 'python-mode-hook 'highlight-indentation-mode )))

;;; configure flymake-python-pyflakes
(use-package flymake-python-pyflakes
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)))

(use-package py-autopep8
  :ensure t
  :init (progn
	  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)))

(provide 'python-mode-init)
;;; End of File
