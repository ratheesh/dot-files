(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (mytheme-dark)))
 '(flymake-python-pyflakes-executable "flake8")
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/tasks_at_work.org" "~/Dropbox/org/janus.org" "~/Dropbox/org/routines.org")))
 '(powerline-default-separator (quote arrow))
 '(powerline-height nil)
 '(powerline-text-scale-factor nil)
 '(sml/show-remote t)
 '(visible-cursor t)
 '(which-func-modes t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter+-separator ((t (:foreground "yellow" :weight normal))))
 '(mode-line ((t (:background "black" :foreground "white" :inverse-video nil :box (:line-width 1 :color "dodger blue") :weight light))))
 '(mode-line-emphasis ((t (:weight light))))
 '(mode-line-highlight ((t (:box (:line-width 1 :color "grey40")))))
 '(persp-selected-face ((t (:inherit sml/filename :foreground "lawn green"))))
 '(powerline-active1 ((t (:inherit mode-line :background "grey22" :foreground "gold"))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey40" :foreground "gold1"))))
 '(sml/filename ((t (:inherit sml/global :foreground "#eab700" :slant italic :weight normal))))
 '(sml/line-number ((t (:inherit sml/modes :weight normal))))
 '(sml/projectile ((t (:inherit sml/git :foreground "orange red"))))
 '(which-func ((t (:foreground "DeepSkyBlue1" :slant italic)))))
