;; global key bindings

(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-,") 'completion-at-point)

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)

;; Experimental multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Quickly jump in document with ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

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
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; git-gutter+
(global-set-key (kbd "C-x p") 'git-gutter+-previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter+-next-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter+-revert-hunk)

;; iy-go-to-char
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue)

;; isearch-symbol-at-point
(global-set-key (kbd "M-s s") 'isearch-symbol-at-point)

;; redo
(global-set-key (kbd "C-?") 'undo-tree-redo)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; C mode key bindings
;; ecb
;; activate and deactivate ecb
(global-set-key "\C-c(" 'ecb-activate)
(global-set-key "\C-c)" 'ecb-deactivate)

;; show/hide ecb window
;; (global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
;; (global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)

;; quick navigation between ecb windows
(global-set-key "\C-c1" 'ecb-goto-window-edit1)
(global-set-key "\C-c2" 'ecb-goto-window-directories)
(global-set-key "\C-c3" 'ecb-goto-window-history)
;; (global-set-key "\C-c4" 'ecb-goto-window-sources)
;; (global-set-key "\C-c5" 'ecb-goto-window-methods)
;; (global-set-key "\C-c6" 'ecb-goto-window-compilation)

;; cscope keybindings
(global-set-key (kbd "<f6>") 'cscope-find-this-text-string)
(global-set-key (kbd "<f7>") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "<f8>") 'cscope-pop-mark)

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
(global-set-key (kbd "C-x g") 'magit-status)

;; from snippets.el
(global-set-key (kbd "M-i") 'ido-goto-symbol)
;(global-set-key "\C-cd" 'duplicate-current-line)
(global-set-key (kbd "C-c d") 'duplicate-thing)

(provide 'key-bindings)
