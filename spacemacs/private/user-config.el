;;; This holds all private configurations to avoid pollution in .spacemacs file

(message "Loading user-config customizations...")

;;; keychord sequence for insert mode -> normal mode in vim/hybrid mode
(setq-default evil-escape-key-sequence "jk")

(global-company-mode 0)
(global-subword-mode 1)
(global-hl-line-mode 1)
(global-linum-mode 1)
(global-auto-revert-mode 1)             ;Global auto revert mode
(fancy-battery-mode)
(delete-selection-mode 1)             ;replace selected text on yank!
;; (smooth-scrolling-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq show-trailing-whitespace t)
(global-git-commit-mode t)

;; Semantic to ignore c-pre-processor
(setq semantic-c-obey-conditional-section-parsing-flag 'nil)
(setq semanticdb-default-save-directory "/home/ratheesh/.emacs.d/.cache/semanticdb/")

;; avoid annoying message about shell configuration
(setq exec-path-from-shell-arguments '("-l"))

;; Set initial buffer to *spacemacs*
(setq initial-buffer-choice (lambda () (get-buffer spacemacs-buffer-name)))

(global-git-commit-mode t)
(add-hook 'c-common-mode-hook (lambda ()
                                (progn
                                  (clean-aident-mode t)
                                  (setq clean-aindent-is-simple-indent t))))
(spacemacs/toggle-aggressive-indent-globally-on)
(spacemacs/toggle-version-control-margin-globally-on)
;; (spacemacs/toggle-automatic-symbol-highlight-on)
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

(add-to-list 'auto-mode-alist '("\\.dts$"   . dts-mode))
(add-to-list 'auto-mode-alist '("\\.dtsi$"  . dts-mode))
(add-to-list 'auto-mode-alist '("Kconfig" . Kconfig-mode))

;;; after display init code
(spacemacs|do-after-display-system-init
 (setq powerline-default-separator 'arrow)
 (version-control/init-git-gutter-fringe)
 (my-gitmode-setup/post-init-git-gutter-fringe)
 )

;;; End of File
