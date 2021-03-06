;;; This file contains defaults that are sane enough for basic Emacs
;;; functionality

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq save-interprogram-paste-before-kill t)

(setq auto-save-default nil) ; stop creating those #auto-save# files
(setq backup-by-copying t);preserve file creation timestamp

(setq gc-cons-threshold 50000000
      line-number-display-limit-width 10000
      initial-scratch-message ""
      initial-major-mode 'emacs-lisp-mode
      initial-buffer-choice 'list-bookmarks
      server-use-tcp t
      read-file-name-completion-ignore-case t
      line-move-visual t
      system-uses-terminfo nil
      show-trailing-whitespace t
      require-final-newline t
      imenu-auto-rescan t
      load-prefer-newer t
      save-interprogram-paste-before-kill t
      scroll-margin 4
      scroll-conservatively 10000
      scroll-preserve-screen-position)

(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

(setq-default
 find-file-visit-truename t
 indicate-empty-lines t)
;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)

;;; Enable hightlight current line
;; (global-hl-line-mode 1)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Keep cursor away from edges when scrolling up/down
;(use-package smooth-scrolling :ensure t)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(use-package undo-tree
  :defer t
  :commands undo-tree-mode
  :ensure t
  :defer t
  :diminish undo-tree-mode
  :init
  (progn
    (global-undo-tree-mode t)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    (define-key undo-tree-map (kbd "C-x u") 'undo-tree-visualize)
    (define-key undo-tree-map (kbd "C-?") 'undo-tree-redo)
    (define-key undo-tree-map (kbd "C-/") 'undo-tree-undo)))

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(use-package uniquify
  :defer t
  :config
  (progn
    (setq uniquify-buffer-name-style 'forward)))

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

(setq scroll-margin 4)

(setq fringe-mode '(1 . 0))
(delete-selection-mode 1)   ;; delete the sel with a keyp
(setq confirm-kill-emacs 'y-or-n-p)
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq vc-handled-backends '(SVN Git))

(setq-default
 user-mail-address "ratheeshreddy@gmail.com"
 user-full-name "Ratheesh S"
 cursor-in-non-selected-windows nil
 cursor-in-non-selected-windows nil
 x-stretch-cursor t ; when on a tab, make the cursor the tab length
 column-number-mode 't
 line-number-mode 't
 display-time 't
 find-file-visit-truename t
 require-final-newline t
 default-major-mode 'text-mode
 even-window-heights nil
 ;; A tab is 8 spaces is 8 spaces is 8 spaces
 default-tab-width 8
 ;; Scrolling is moving the document, not moving my eyes
 scroll-preserve-screen-position 'keep
 ;; nice comment format
 comment-style 'extra-line
 ;; Don't show a cursor in other windows
 cursor-in-non-selected-windows nil
 ;; i want a mouse yank to be inserted where the point is, not where i click
 mouse-yank-at-point t
 ;; Don't highlight stuff that I can click on all the time. I don't click
 ;; anyways.
 mouse-highlight 1
)

(use-package linum+)
(global-linum-mode t)
(use-package hlinum :ensure t :defer t)
(hlinum-activate)

;;; open bookmarks buffer on startup
(use-package bookmark
  :defer t
  :config
  (progn
    (bookmark-bmenu-list)
    (switch-to-buffer "*Bookmark List*")))

;; Show me your parens!
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;save the file modification timstamp at the time os saving
(add-hook 'before-save-hook 'time-stamp)

(setq show-trailing-whitespace)
(setq whitespace-style '(face trailing))

;; (iswitchb-mode t)
(use-package lisp-mode
  :defer t
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq mode-name " ξ "))))

;;Turn on documentation in elisp mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
	     (turn-on-eldoc-mode)))

(use-package tramp
  :ensure t
  :defer t
  :config
  (progn
    (setq tramp-default-method "ssh")))

;;; make sure that scratch buffer is always available
(use-package scratch-ext
  :ensure t
  :defer t)

(use-package expand-region
  :ensure t
  :defer t
  :bind
  (("M-=" . er/expand-region)
   ("M--" . er/contract-region)))

(use-package multiple-cursors
  :ensure t
  :defer t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C-S-c C-e" . mc/edit-ends-of-lines)
   ("C-S-c C-a" . mc/edit-beginnings-of-lines)
   ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package smart-forward
  :defer t
  :ensure t)

(provide 'sane-defaults)
