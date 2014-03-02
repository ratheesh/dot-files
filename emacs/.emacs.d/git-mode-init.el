;;; initialize git mode

(when (require 'git-commit-mode nil 'noerror)
  (add-hook 'git-commit-mode-hook 'turn-on-flyspell)
  (add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0))))

;git mode configuration
(when (require 'git-commit-training-wheels-mode nil 'noerror)
  (add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode))

(when (window-system)
  (require 'linum+)
  (global-linum-mode t)
  (require 'git-gutter+)
  (require 'fringe-helper)
  (require 'git-gutter-fringe+)
  (global-git-gutter+-mode t)
  ;; (setq-default left-fringe-width  20)
  ;; (setq-default right-fringe-width 20)
  (setq git-gutter-fr+-side 'right-fringe)
  (set-face-foreground 'git-gutter-fr+-modified "yellow")
  (set-face-foreground 'git-gutter-fr+-added    "green")
  (set-face-foreground 'git-gutter-fr+-deleted  "red"))

(add-hook 'before-make-frame-hook
          #'(lambda ()
	      (require 'linum+)
	      (global-linum-mode t)
	      (require 'hlinum)
	      (hlinum-activate)
	      (require 'git-gutter+)
	      (require 'fringe-helper)
	      (require 'git-gutter-fringe+)
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

;;; git messenger - pop last commit message on the current line
(require 'git-messenger nil 'noerror)

;;; stgit-mode - stgit wrapper for eMacs
(require 'stgit nil 'noerror)

(provide 'git-mode-init)
