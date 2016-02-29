
(defun my-gitmode-init ()
  (progn
    (global-git-commit-mode t)
    (add-hook 'git-setup-mode-hook 'turn-on-flyspell)
    (add-hook 'git-commit-setup-hook (lambda () (toggle-save-place 0)))
    (add-hook 'git-commit-setup-hook
              (lambda ()
                (setq fci-rule-column 72)
                (setq fill-column 72)
                (turn-on-auto-fill)))

    ))

(add-hook 'server-done-hook (lambda nil
                              (kill-buffer nil)
                              (setq fci-rule-column 80)))
