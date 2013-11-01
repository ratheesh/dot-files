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

(require 'powerline)
(powerline-default-theme)

;save the file modification timstamp at the time os saving
(add-hook 'before-save-hook 'time-stamp)

;(setq show-trailing-whitespace)
(setq whitespace-style '(face trailing))

;;; C Mode
(require 'ascope)
(setq cscope-do-not-update-database t)

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

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

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

;;;;;;;;; Org Mode setup
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Org mode setup
(require 'org-install)
(require 'org-bullets)
(require 'org-habit)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented t)
(setq org-indent-mode t)
(global-auto-revert-mode t)

(add-hook 'message-mode-hook 'turn-on-orgtbl)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done 'time);log time of DONE items
(setq org-log-done 'note);record time with note

(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("STARTED" . "color-161")
             ("CANCELED" . (:foreground "brightblue" :weight bold))
	          ("DONE" . (:foreground "brightgreen" :weight bold))
))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;MobileOrg setup - make sure to set the appropriate pass in the App
(setq org-directory "~/Dropbox/org");local org folder
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg");MobileOrg folder
(setq org-mobile-files '("~/Dropbox/org"));MobileOrg folder
;(setq org-agenda-files (quote ( "~/Dropbox/org/agenda.org")));agenda file
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org");new notes file
;(setq org-mobile-use-encryption t);use encryption
(setq org-todo-keywords
 '((type "TODO(t)" "STARTED(s)" "APPT(a)" "|" "CANCELLED(c)" "DEFERRED(e)" "DONE(d)")
   (sequence "PROJECT(p)" "|" "FINISHED(f)")
   (sequence "INVOICE(i)" "SENT(n)" "|" "RCVS(r)")))

;; Emacs custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/home/ratheesh/development/ratheesh/beagle_Bone/git/linux-stable" "stock-kernel") ("/home/ratheesh/development/ratheesh/beagle_Bone/git/u-boot" "u-boot") ("/home/ratheesh/development/ratheesh/beagle_Bone/git/kernel_beaglebone_web/kernel" "bone-kernel") ("/data/ratheesh/beagle_Bone/git/kernel_beaglebone_web/kernel" "ang-bone-kernel") ("/data/ratheesh/beagle_Bone/git/linux-stable" "linux-stable")))) 
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("MELPA" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(solarized-colors 256)
 '(solarized-termcolors 256)
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#2aa198" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#dc322f" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#859900"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#268bd2" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#b58900"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#d33682"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#cb4b16" :weight bold))))
 '(tramp-default-user "ratheesh")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#b58900") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#859900") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#2aa198") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
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


