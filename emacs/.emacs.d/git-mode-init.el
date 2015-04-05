;;; initialize git mode

(use-package git-commit-mode
  :init
  (progn
    (add-hook 'git-commit-mode-hook 'turn-on-flyspell)
    (add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0)))
    (add-hook 'git-commit-mode-hook
	      (lambda ()
		(setq fci-rule-column 72)
		(setq fill-column 72)
		(turn-on-auto-fill)
		(font-lock-set-up-width-warning 72)))
    ))

;; cleanup after git commit is done
(add-hook 'server-switch-hook
	  (lambda ()
	    (menu-bar-mode -1)))
(add-hook 'server-done-hook (lambda nil
			      (kill-buffer nil)
			      (setq fci-rule-column 80)))

;git mode configuration
(use-package git-commit-training-wheels-mode
  :init
  (progn
    (add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode)))

(when (window-system)
  (use-package linum+)
  (global-linum-mode t)
  (use-package git-gutter+)
  (use-package fringe-helper)
  (use-package git-gutter-fringe+)
  (global-git-gutter+-mode t)
  ;; (setq-default left-fringe-width  20)
  ;; (setq-default right-fringe-width 20)
  ;; (setq git-gutter-fr+-side 'right-fringe)
  (set-face-foreground 'git-gutter-fr+-modified "yellow")
  (set-face-foreground 'git-gutter-fr+-added    "green")
  (set-face-foreground 'git-gutter-fr+-deleted  "red"))

(add-hook 'before-make-frame-hook
          #'(lambda ()
	      (use-package linum+)
	      (global-linum-mode t)
	      (use-package hlinum)
	      (hlinum-activate)
	      (use-package git-gutter+)
	      (use-package fringe-helper)
	      (use-package git-gutter-fringe+)
	      (global-git-gutter+-mode t)
	      ;; (setq-default left-fringe-width  20)
	      ;; (setq-default right-fringe-width 20)
	      ;; (setq git-gutter-fr+-side 'right-fringe)
	      (set-face-foreground 'git-gutter-fr+-modified "yellow")
	      (set-face-foreground 'git-gutter-fr+-added    "green")
	      (set-face-foreground 'git-gutter-fr+-deleted  "red")))

;;; configure gitconfig and gitignore modes
(use-package gitconfig-mode)
(use-package gitignore-mode)

;; (require 'git-gutter+)
;; ;; If you enable global minor mode
;; (global-git-gutter+-mode t)
;; (setq git-gutter+-separator-sign "|")
;; (set-face-foreground 'git-gutter+-separator "yellow")

;; Customizing colors used in diff mode
(defun custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "green" :background 'unspecified)
  (set-face-attribute
   'diff-removed nil :foreground "red" :background 'unspecified)
  (set-face-attribute
   'diff-changed nil :foreground "purple" :background 'unspecified))
(eval-after-load "diff-mode" '(custom-diff-colors))

;;; git messenger - pop last commit message on the current line
(use-package git-messenger
  :bind
  (("C-c v p" . git-messenger:popup-message)))

;;; stgit-mode - stgit wrapper for eMacs
(use-package stgit
  :config
  (progn ;; I donot if we can put under :mode category
    (add-to-list 'auto-mode-alist ' ("\\.stgit-edit.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist ' ("\\.stgit-new.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist ' ("\\.stgit-squash.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist ' ("\\.stgitmsg.txt$"  . git-commit-mode))))

(use-package magit
  :ensure t
  :bind
  (("C-x g". magit-status))
  :init
  (progn
    (use-package magit-stgit :ensure t)))
(add-hook 'magit-mode-hook 'magit-load-config-extensions)

(provide 'git-mode-init)
