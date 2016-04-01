;;; This holds all private configurations to avoid pollution in .spacemacs file

(message "Loading user-config customizations...")

;;; keychord sequence for insert mode -> normal mode
(setq-default evil-escape-key-sequence ",.")

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
(add-hook 'prog-mode-hook 'clean-aindent-mode)
(spacemacs/toggle-aggressive-indent-globally-on)
(spacemacs/toggle-version-control-margin-globally-on)
(spacemacs/toggle-hungry-delete-on)
(spacemacs/toggle-yasnippet-on)

;;; ido-find-file is much better than helm counterpart
(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;;; evil mode settings
(setq evil-move-cursor-back nil)

;;; mode mappings
(add-to-list 'auto-mode-alist '("\\.*rc$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.*sh$" . shell-script-mode))
;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.tmux\\.conf$" . conf-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

(add-to-list 'auto-mode-alist '("\\.dts\\'"   . dts-mode))
(add-to-list 'auto-mode-alist '("\\.dtsi\\'"  . dts-mode))
(add-to-list 'auto-mode-alist '("Kconfig" . Kconfig-mode))

;;; after display init code
(spacemacs|do-after-display-system-init
 (setq powerline-default-separator 'alternate)
 (version-control/init-git-gutter-fringe)
 (my-gitmode-setup/post-init-git-gutter-fringe)
 )

;;; End of File
