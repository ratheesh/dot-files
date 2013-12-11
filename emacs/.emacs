;;-*-Emacs-Lisp-*-
;; .emacs
;; Ratheesh
;; October 2013
;; some stuff is taken from http://www.dgp.toronto.edu/~ghali/emacs.html
;; Special thanks to santosh shivraj

; Meine Emacs Einstellungen
;; This file does not work with XEmacs.
(when (featurep 'xemacs)
  (error "This .emacs file does not work with XEmacs."))

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Emacs custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#E5786D" "#95E454" "#CAE682" "#8AC6F2" "#333366" "#CCAA8F" "#F6F3E8"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote ("1c62a630c5c83db30a2d6bfda0b10f749d9b5ea8e2d23376b2d3a57798f401a9" "e33028893a2eecc1cc5a02fbabc7cda3954be3879adc0084470d30619b59ac64" "0ac706cfca8506474164cfc633a91dba15782aa7692785163121142ff72ab099" "75d4ccc5e912b93f722e57cca3ca1a15e079032cd69fd9bc67268b4c85639663" "99cbc2aaa2b77374c2c06091494bd9d2ebfe6dc5f64c7ccdb36c083aff892f7d" "690585947abcb3fc7f52e6683b8375f00eef7ea55d028dcf81c9f5accb4dffe5" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "446c73cdfb49f1dab4c322e51ac00a536fb0e3cb7e6809b9f4616e0858012e92" "41c8deb49dea6ee40db394acda39f5ebc649c13559534c9faaebcb320d044aef" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("")))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
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
 )

(load-theme 'my-emacs-term t)
(load "~/.emacs.d/init.el")

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(load-file "~/.emacs.d/lisp/ido-goto-symbol.el")

(require 'smart-mode-line)
(setq sml/theme 'light)
(add-to-list 'sml/replacer-regexp-list '("^/home/ratheesh" ":HOME:"))
(sml/setup)
;(setq sml/active-background-color "gray60")

;; Turn on Icicles mode, do this last
;
;(require 'icicles)
;(icy-mode 1)
