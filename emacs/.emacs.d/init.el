;;--*-- Mode: Lisp --*--
(provide 'package)
;; Load other config file
(load "~/.emacs.d/org-init")
(load "~/.emacs.d/devel-init")

(require 'linum+)

;;(global-hl-line-mode 1)
(global-linum-mode t)
(global-highlight-changes-mode t)

(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
;;
;; we speak utf-8 here
(prefer-coding-system 'latin-1)
(if (not (assoc "UTF-8" language-info-alist))
    (set-language-environment "latin-1")
  (set-language-environment "utf-8")
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))

;; get rid of yes-or-no questions - y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode  t)                       ;; show the menu...
(mouse-avoidance-mode 'jump)             ;; mouse ptr when cursor is too close
(tool-bar-mode -1)                       ;; turn-off toolbar 
(size-indication-mode t)                 ;; show file size (emacs 22+)

(setq fringe-mode '(1 . 0))              ;; emacs 22+
;(delete-selection-mode 1)                ;; delete the sel with a keyp


(setq mac-option-modifier 'command)
(setq mac-command-modifier 'meta)

;; higlight changes in documents

(setq highlight-changes-visibility-initial-state nil); initially hide

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "Gray")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
;(global-hl-line-mode t) ; turn it on for all modes by default

;;; General setup
(setq
 frame-title-format '("%b %* %m")
 delete-key-deletes-forward t
 mouse-yank-at-point t
 scroll-step 1 ;; keyboard scroll one line at a time
 minibuffer-max-depth nil
 man-switches "-a"
 require-final-newline t   ; file ends with new line?
 ; show-paren-style 'expression
 confirm-kill-emacs 'y-or-n-p
 completion-ignored-extensions '(".o" ".elc" )
 scroll-preserve-screen-position 1
 calendar-latitude 12.971599
 calendar-longitude 77.594563
 line-spacing 1
 visible-bell t
 global-auto-revert-mode t
 scroll-preserve-screen-position 1 ; Pgup/dn will return exactly to the starting
                                   ; point.
 text-mode-hook 'turn-on-auto-fill ; Sets autofill on in text mode automatically
 ;; Some pretty stuff
 font-lock-maximum-decoration t
 inhibit-startup-message t
 query-replace-highlight t
 search-highlight t
 global-font-lock-mode 1
 transient-mark-mode t
)

(setq-default
 user-mail-address "ratheesh@gmail.com"
 cursor-in-non-selected-windows nil
 cursor-in-non-selected-windows nil
 x-stretch-cursor t              ; when on a tab, make the cursor the tab length
 fill-column 80                  ; Nothing over 80 characters please
 indent-tabs-mode nil
 column-number-mode 't
 line-number-mode   't
 display-time       't
 ;; we usually want a final newline...
 require-final-newline 'ask
 ;; If you don't know, just give me text-mode
 default-major-mode 'text-mode
 ;; I don't like emacs destroying my window setup
 even-window-heights nil
 ;; Same here
 resize-mini-windows nil
 ;; No am/pm here
 display-time-24hr-format t
 ;; A tab is 8 spaces is 8 spaces is 8 spaces
 default-tab-width 8
 ;; Scrolling is moving the document, not moving my eyes
 scroll-preserve-screen-position 'keep
 ;; I kinda know my emacs
 inhibit-startup-message t
 ;; nice comment format
 comment-style 'extra-line
 ;; Don't show a cursor in other windows
 cursor-in-non-selected-windows nil
 ;; A wide characters ask for a wide cursor
 x-stretch-cursor t
 ;; i want a mouse yank to be inserted where the point is, not where i click
 mouse-yank-at-point t
 ;; Don't highlight stuff that I can click on all the time. I don't click
 ;; anyways.
 mouse-highlight 1
)

;;;;;;;;;;;;;;;;;;;;
;;; Global modes ;;;
;;;;;;;;;;;;;;;;;;;;

;; no menu bar
;; On Macs, this causes weird behavior, though.
(when (not (eq window-system 'mac))
  (menu-bar-mode -1))

;; and no toolbar in emacs21 either
(when (and (featurep 'tool-bar)
           window-system)
  (tool-bar-mode -1))

(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; But I like syntax highlighting
(global-font-lock-mode 1)

;; transparently work with compressed files
(auto-compression-mode 1)

; I liebe rainbow-mode
(rainbow-mode t)

;; Give me columns and lines
(column-number-mode 1)
(line-number-mode 1)

;; Display time
(display-time)

;; Show the region by default
(transient-mark-mode 1)
;; But don't bitch if it's not shown
(setq mark-even-if-inactive t)

;; Do random numbers
(random t)

;; Show me your parens!
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;; Sometimes, Emacs fucks up my window config.
;; Let me fix it easily.
(winner-mode 1)

(global-auto-revert-mode t)

;(require 'powerline)
;(powerline-default-theme)
;(setq powerline-color1 "#073642")
;(setq powerline-color2 "#002b36")

;(set-face-attribute 'mode-line nil
;                    :foreground "#fdf6e3"
;                    :background "color-27"
;		    :inverse-video nil
;                    :box nil)
;(set-face-attribute 'mode-line-inactive nil
;		    :inverse-video nil
;                    :box nil)

;save the file modification timstamp at the time os saving
(add-hook 'before-save-hook 'time-stamp)

;(setq show-trailing-whitespace)
(setq whitespace-style '(face trailing))

;(toggle-hl-line-when-idle 10)

(iswitchb-mode t)

(require 'magit)
(autoload 'magit-status "magit" nil t)

(require 'ido)
(ido-mode t)
(ido-mode 'both) ;; for buffers and files
;(setq ido-enable-flex-matching t)

;;(modeline ((t (:background "darkblue" :foreground "yellow"))))
;;(set-face-background 'modeline "Blue"

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'parenthesis) ; alternatives are 'parenthesis' and 'mixed'


;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

