;; keybindings for common settings

;;; no background on C-z
(global-set-key (kbd "C-z") nil)

;;; text scale shortcuts
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "C-S-k") 'kill-line-backward)

;;; easy short cuts for window management
(global-set-key (kbd "M-9") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; open recently opened files
(global-unset-key (kbd "C-x C-r"))
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-unset-key (kbd "C-o"));
(global-unset-key (kbd "C-S-o"));
(global-unset-key (kbd "C-:"));
(global-set-key (kbd "C-o") 'insert-line-below)
(global-set-key (kbd "C-S-o") 'insert-line-above)
(global-set-key (kbd "C-:") 'select-current-line)

;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

(global-set-key (kbd "<f5>") 'revert-buffer)

;; expand region shortcuts
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)

;; shorcut to kill-buffer
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-this-buffer)

;; (global-set-key (kbd "M-i") 'ido-goto-symbol)
(global-set-key (kbd "C-c d") 'duplicate-thing)

(global-set-key (kbd "C-h C-/") 'fasd-find-file-only)
