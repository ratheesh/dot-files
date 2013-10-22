;;-*-Emacs-Lisp-*-
;; .emacs
;; Ratheesh
;; October 2013
;; some stuff is taken from http://www.dgp.toronto.edu/~ghali/emacs.html
;; Special thanks to santosh shivraj

; Meine Emacs Einstellungen

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; higlight changes in documents
(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil); initially hide

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "Gray")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
;(global-hl-line-mode t) ; turn it on for all modes by default

;;(global-hl-line-mode 1)
(global-linum-mode t)
(require 'linum+)

(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
;;
(menu-bar-mode  t)                       ;; show the menu...
(mouse-avoidance-mode 'jump)             ;; mouse ptr when cursor is too close
(tool-bar-mode -1)                       ;; turn-off toolbar 
(size-indication-mode t)                 ;; show file size (emacs 22+)

(setq fringe-mode '(1 . 0))              ;; emacs 22+
;(delete-selection-mode 1)                ;; delete the sel with a keyp

;;; General setup
(setq
 frame-title-format '("%b %* %m")
 delete-key-deletes-forward t
 mouse-yank-at-point t
 scroll-step 1 ;; keyboard scroll one line at a time
 minibuffer-max-depth nil
 Man-swtiches "-a"
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
 winner-mode 1)

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
)


;save the file modification timstamp at the time os saving
(add-hook 'before-save-hook 'time-stamp)

;(setq show-trailing-whitespace)
(setq whitespace-style '(face trailing))

;;fci-column-indicator mode
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode 1)
(setq fci-rule-width 1)
(setq fci-rule-color "cyan")
(defun auto-fci-mode (&optional unused)
(if (> (window-width) fci-rule-column)
      (fci-mode 1)
      (fci-mode 0))
)

(setq c-default-style "linux")

(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)
(add-hook 'c-mode-common-hook 'fci-mode)

(add-hook 'c-mode-common-hook
            (lambda ()
            (font-lock-add-keywords nil
            '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

(add-hook 'makefile-mode-hook 
  (lambda()
    (setq show-trailing-whitespace t)))

(add-hook 'c-mode-common-hook 
  (lambda()
    (require 'dtrt-indent)
    (dtrt-indent-mode t)))

(require 'cc-mode)
(setq-default c-basic-offset 8 c-default-style "linux")
(setq-default tab-width 8 indent-tabs-mode t)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(require 'yasnippet-bundle)
;(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

(require 'whitespace)
;(setq-default show-trailing-whitespace t)
(add-hook 'c-mode-hook 
   '(lambda () 
      (whitespace-toggle-options t)
))

;;; Whitespace mode setup
(setq whitespace-style '(face lines-tail trailing empty space-before-tab))
;(toggle-hl-line-when-idle 10)

(iswitchb-mode t)

(require 'ido)
(ido-mode t)
(ido-mode 'both) ;; for buffers and files
;(setq ido-enable-flex-matching t)

;;(modeline ((t (:background "darkblue" :foreground "yellow"))))
;;(set-face-background 'modeline "Blue"

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'parenthesis) ; alternatives are 'parenthesis' and 'mixed'

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode 'set-newline-and-indent)

(add-hook 'c-mode-common-hook 
  (lambda ()
    (which-function-mode t)))

(load "gtags.el" nil t t)
(add-hook 'gtags-mode-hook 
	  '(lambda () 
	     (require 'gtags)
	     (gtags-mode t)))

;(autoload 'gtags-mode "gtags" "" t)

(require 'ecb)
;(require 'ecb-autoloads)
(setq ecb-layout-name "rathy-dh-layout")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height nil)
;;; activate and deactivate ecb
(global-set-key "\C-c(" 'ecb-activate)
(global-set-key "\C-c)" 'ecb-deactivate)
;;; show/hide ecb window
;(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
;(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key "\C-c1" 'ecb-goto-window-edit1)
(global-set-key "\C-c2" 'ecb-goto-window-directories)
(global-set-key "\C-c3" 'ecb-goto-window-history)
;(global-set-key "\C-c4" 'ecb-goto-window-sources)
;(global-set-key "\C-c5" 'ecb-goto-window-methods)
;(global-set-key "\C-c6" 'ecb-goto-window-compilation)
 

(defun duplicate-current-line ()
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))
(global-set-key "\C-cd" 'duplicate-current-line)

(load "auctex-pkg.el" nil t t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/home/ratheesh/development/ratheesh/beagle_Bone/git/linux-stable" "stock-kernel") ("/home/ratheesh/development/ratheesh/beagle_Bone/git/u-boot" "u-boot") ("/home/ratheesh/development/ratheesh/beagle_Bone/git/kernel_beaglebone_web/kernel" "bone-kernel") ("/data/ratheesh/beagle_Bone/git/kernel_beaglebone_web/kernel" "ang-bone-kernel") ("/data/ratheesh/beagle_Bone/git/linux-stable" "linux-stable"))))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("MELPA" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(tramp-default-user "ratheesh"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((((class color)) (:background "#303030"))))
 '(font-lock-doc-face ((((class color)) (:background "#282828"))))
 '(font-lock-function-name-face ((((class color)) (:foreground "#00bfff"))))
 '(font-lock-keyword-face ((((class color)) (:foreground "#483d8b"))))
 '(font-lock-string-face ((((class color)) (:italic t :foreground "orange"))))
 '(font-lock-type-face ((((class color)) (:foreground "#483d8b"))))
 '(font-lock-variable-name-face ((((class color)) (:foreground "white"))))
 '(linum ((t (:background "gray30" :foreground "gray90")))))

;; Turn on Icicles mode, do this last
(icy-mode 1)


(setq load-home-init-file t) ; don't load init file from ~/.xemacs/init.el
