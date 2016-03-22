;;; This holds all private configurations to avoid pollution in .spacemacs file

;; (message "Loading Spacemacs customizations...")
(global-subword-mode 1)
(global-hl-line-mode 1)
(global-linum-mode 1)
(fancy-battery-mode)
(delete-selection-mode 1)             ;replace selected text on yank!
(smooth-scrolling-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; set the font here
(set-face-attribute 'default nil :family "MonacoB")
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono for Powerline")
(set-face-attribute 'default nil :height 130)

;; Semantic to ignore c-pre-processor
(setq semantic-c-obey-conditional-section-parsing-flag 'nil)
(setq semanticdb-default-save-directory "/home/ratheesh/.emacs.d/.cache/semanticdb/")

;; avoid annoying message about shell configuration
(setq exec-path-from-shell-arguments '("-l"))

;; Set initial buffer to *spacemacs*
(setq initial-buffer-choice (lambda () (get-buffer spacemacs-buffer-name)))

(global-git-commit-mode t)

;; enable clean-aindent-mode for programming mode
(add-hook 'prog-mode-hook 'clean-aindent-mode)
;; (global-aggressive-indent-mode 1)
(spacemacs/toggle-aggressive-indent-globally-on)
(spacemacs/toggle-version-control-margin-globally-on)

(spacemacs|do-after-display-system-init
 (setq powerline-default-separator 'zigzag)
 (version-control/init-git-gutter-fringe)
 (my-gitmode-setup/post-init-git-gutter-fringe)
 )

;;; End of File
