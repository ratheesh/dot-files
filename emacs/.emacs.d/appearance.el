;;; appearence settings

(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; org-mode colors
(setq org-todo-keyword-faces
      '(
        ("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))
        ))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(use-package rainbow-mode
  :config
  (progn
    (dolist (hook '(css-mode-hook
		    html-mode-hook
		    js-mode-hook
		    emacs-lisp-mode-hook
		    org-mode-hook
		    text-mode-hook
		    ))
      (add-hook hook 'rainbow-mode))))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; ;; Unclutter the modeline
(when (require 'diminish)
  (eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
  (eval-after-load "eldoc" '(diminish 'eldoc-mode))
  (eval-after-load "paredit" '(diminish 'paredit-mode))
  (eval-after-load "tagedit" '(diminish 'tagedit-mode))
  (eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
  (eval-after-load "skewer-mode" '(diminish 'skewer-mode))
  (eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
  (eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
  (eval-after-load "smartparens" '(diminish 'smartparens-mode))
  (eval-after-load "git-gutter+" '(diminish 'git-gutter+-mode))
  (eval-after-load "ggtags" '(diminish 'ggtags-mode))
  (eval-after-load "whitespace" '(diminish 'whitespace-mode))
  (eval-after-load "flyspell" '(diminish 'flyspell-mode))
  (eval-after-load "abbrev" '(diminish 'abbrev-mode))
  (eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
  (eval-after-load "auto-complete" '(diminish 'auto-complete-mode)))

(provide 'appearance)
