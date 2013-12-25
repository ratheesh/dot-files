;; common initialization

;;ido mode
(require 'ido)
(ido-mode t)
(ido-mode 'both) ;; for buffers and files
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10
      resize-mini-windows 'grow-only
      max-mini-window-height 0.5
      completion-ignored-extensions
          '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".mod" ".cmd")
      )

;; Try out flx-ido for better flex matching between words
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; flx-ido looks better with ido-vertical-mode
(require 'ido-vertical-mode)
(ido-vertical-mode)

(defun sd/ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

;; Ido at point (C-,)
(require 'ido-at-point)
(ido-at-point-mode)

;;smex
(require 'smex)
(smex-initialize)

;; smart mode line
(require 'smart-mode-line)
(sml/setup)

;git mode configuration
(require 'git-commit-training-wheels-mode)
(add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode)

;; cleanup after git commit is over
(add-hook 'server-switch-hook
  (lambda ()
    (menu-bar-mode -1)))
(add-hook 'server-done-hook (lambda nil (kill-buffer nil)))

(require 'git-commit)
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0)))

(when (window-system)
(require 'fringe-helper)
  (require 'git-gutter-fringe+))

(require 'git-gutter+)
;; If you enable global minor mode
(global-git-gutter+-mode t)
(setq git-gutter+-separator-sign "|")
(set-face-foreground 'git-gutter+-separator "yellow:nobold")

;(setq-default indicate-buffer-boundaries 'left)
;(setq-default indicate-empty-lines +1)

(require 'iy-go-to-char)

(provide 'common-init)
