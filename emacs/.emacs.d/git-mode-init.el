;;; initialize git mode

(use-package git-commit-mode
  :init
  (progn
    (add-hook 'git-commit-mode-hook 'turn-on-flyspell)
    (add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0)))
    ))

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
  (setq git-gutter-fr+-side 'right-fringe)
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
	      (setq git-gutter-fr+-side 'right-fringe)
	      (set-face-foreground 'git-gutter-fr+-modified "yellow")
	      (set-face-foreground 'git-gutter-fr+-added    "green")
	      (set-face-foreground 'git-gutter-fr+-deleted  "red")))

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
  (("C-x v p" . git-messenger:popup-message)))

;;; stgit-mode - stgit wrapper for eMacs
(use-package stgit
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.stgit-edit.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist '("\\.stgit-new.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist '("\\.stgit-squash.txt$"  . git-commit-mode))
    (add-to-list 'auto-mode-alist '("\\.stgitmsg.txt$"  . git-commit-mode))))

(provide 'git-mode-init)
