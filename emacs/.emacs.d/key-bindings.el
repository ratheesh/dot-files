;; global key bindings

(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "C-S-k") 'kill-line-backward)

(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-this-buffer)

;;; easy short cuts for window management
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-,") 'completion-at-point)

;; Quickly jump in document with ace-jump-mode
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; goto-last-change
(global-set-key (kbd "C-x C-/") 'goto-last-change)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

(global-unset-key (kbd "C-o")); used for newline below
(global-unset-key (kbd "C-S-o")); used for newline above
(global-unset-key (kbd "C-:")); used for newline above
(global-set-key (kbd "C-o") 'insert-line-below)
(global-set-key (kbd "C-S-o") 'insert-line-above)
(global-set-key (kbd "C-:") 'select-current-line)

;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; recentf
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Magit
(autoload 'magit-status "magit")

;; git-gutter+
(global-set-key (kbd "C-x p") 'git-gutter+-previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter+-next-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter+-revert-hunk)
(global-set-key (kbd "C-x v t") 'git-gutter+-show-hunk)

;; iy-go-to-char
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue)

;; isearch-symbol-at-point
(global-set-key (kbd "M-s s") 'isearch-symbol-at-point)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; C mode key bindings
(global-set-key (kbd "<f9>") 'ack)

;; org mode key-bindings
(define-key global-map [(control meta ?r)] 'remember)
(global-set-key (kbd "C-c r") 'remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; misc
(global-set-key (kbd "<f5>") 'revert-buffer)

;; from snippets.el
(global-set-key (kbd "M-i") 'ido-goto-symbol)
;(global-set-key "\C-cd" 'duplicate-current-line)
(global-set-key (kbd "C-c d") 'duplicate-thing)

(provide 'key-bindings)
