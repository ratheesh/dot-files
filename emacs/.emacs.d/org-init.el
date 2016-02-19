;; Org Mode setup
(provide 'package)

;; Required elisp packages
(use-package org-bullets
  :ensure t
  :config
  (progn
    (setq org-bullets-face-name (quote org-bullet-face))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    (setq org-bullets-bullet-list '( "✡" "⎈" "✽" "✲" "✱" "✻" "✼" "✽" "✾" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇"))
    (setq org-ellipsis "⚡⚡⚡");; ⤵ ≫
    (setq org-bullets-face-name (quote org-bullet-face))))

(use-package org-habit :defer t)
(use-package remember :defer t)
;(use-package remember-autoloads)

;; default file encoding settings
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;; Enable org mode for the files with .org extension
(use-package org
  :ensure t
  :pin melpa-stable
  :init
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  :config
  (progn
    ;; common org mode variable settings
    (setq
     org-startup-indented t
     org-indent-mode t
     org-log-done t
     org-agenda-show-log t
     org-log-repeat 'time
     org-agenda-include-diary t
     org-agenda-include-all-todo t
     org-completion-use-ido t
     org-hide-leading-stars t
     org-clock-persist 'history
     org-agenda-include-diary t
     org-todo-keywords
     '((type "TODO(t)" "STARTED(s)" "DELAYED(q@/!)" "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "DEFERRED(e@/!)" "DONE(d@/!)"))))

  ;; Org mode hooks
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'remember-mode-hook 'org-remember-apply-template)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'message-mode-hook 'turn-on-orgtbl)
  (add-hook 'org-mode-hook
  	    (lambda ()
  	      (org-set-local 'yas/trigger-key [tab])
  	      (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))
  (add-hook 'org-mode-hook
  	    (lambda ()
  	      (make-variable-buffer-local 'yas/trigger-key)
  	      (setq yas/trigger-key [tab])
  	      (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
  	      (define-key yas/keymap [tab] 'yas/next-field)))
  )

;; Org mode keyword face customization
;; consider putting these in the theme file TODO!
(setq org-todo-keyword-faces
     '(("TODO" . "color-184")
       ("STARTED" . "color-161")
       ("DELAYED" . "color-94")
       ("WAITING" . "DarkOrange1")
       ("CANCELED" . (:foreground "color-144" :weight bold))
       ("DEFERRED" . (:foreground "color-154" :weight bold))
       ("DONE" . (:foreground "green" :weight bold))
))
(org-clock-persistence-insinuate)

;;; fix for yasnippet and autoconfig
;;; from http://iany.me/2012/03/fix-tab-binding-for-yasnippet-and-auto-complete/
(defun yas-ac-tab-noconflict ()
  (let ((command (key-binding [tab]))) ; remember command
    (local-unset-key [tab]) ; unset from (kbd "<tab>")
    (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
;; (add-hook 'org-mode-hook 'yas-ac-tab-noconflict)

;;;;;;;;;; Fix arrow key issue when running emacs inside tmux env
(if (getenv "TMUX")
  (progn
    (let ((x 2) (tkey ""))
      (while (<= x 8)
	  ;; shift
	  (if (= x 2)
	     (setq tkey "S-"))
	  ;; alt
	  (if (= x 3)
	     (setq tkey "M-"))
	  ;; alt + shift
	  (if (= x 4)
	     (setq tkey "M-S-"))
	  ;; ctrl
	  (if (= x 5)
	     (setq tkey "C-"))
	  ;; ctrl + shift
	  (if (= x 6)
	     (setq tkey "C-S-"))
	  ;; ctrl + alt
	  (if (= x 7)
	     (setq tkey "C-M-"))
	  ;; ctrl + alt + shift
	  (if (= x 8)
	     (setq tkey "C-M-S-"))
	  ;; arrows
	  (define-key key-translation-map (kbd (format "M-[ 1 ; %d A" x)) (kbd (format "%s<up>" tkey)))
	  (define-key key-translation-map (kbd (format "M-[ 1 ; %d B" x)) (kbd (format "%s<down>" tkey)))
	  (define-key key-translation-map (kbd (format "M-[ 1 ; %d C" x)) (kbd (format "%s<right>" tkey)))
	  (define-key key-translation-map (kbd (format "M-[ 1 ; %d D" x)) (kbd (format "%s<left>" tkey)))
	  (setq x (+ x 1))
      )
     )
  )
)

;;MobileOrg setup
(setq
 org-directory "~/Dropbox/org" ;local org folder
 org-agenda-files (file-expand-wildcards "~/Dropbox/org/*.org")
 org-mobile-directory "~/Dropbox/Apps/MobileOrg" ;MobileOrg folder
;; org-mobile-files '("~/Dropbox/org") ;files to be pushed
;; org-agenda-files (quote ( "~/Dropbox/org/agenda.org")) ;agenda file
 org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org" ;new notes file
; org-mobile-use-encryption t ;use encryption
)

;;; Org-page setup
(use-package org-page
  :ensure t
  :pin melpa-stable
  :demand t
  :init
  (progn
    (setq op/repository-directory "/home/ratheesh/ppcport/git/ratheesh.github.io/")
    (setq
     op/site-domain "http://ratheesh.github.io/"
     op/site-main-title "Ratheesh's Tech Ramblings!"
     op/site-sub-title "==============> ನನ್ನ ತಾಂತ್ರಿಕ ಮೆಲುಕುಗಳು!"
     op/personal-github-link "https://github.com/ratheesh"
     op/personal-disqus-shortname "Ratheesh"
     op/personal-google-analytics-id "UA-73982336-1")

    (setq op/category-config-alist
	  '(("blog" ;; this is the default configuration
	     :show-meta t
	     :show-comment t
	     :uri-generator op/generate-uri
	     :uri-template "/blog/%y/%m/%d/%t/"
	     :sort-by :date     ;; how to sort the posts
	     :category-index t) ;; generate category index or not
	    ("wiki"
	     :show-meta t
	     :show-comment nil
	     :uri-generator op/generate-uri
	     :uri-template "/wiki/%t/"
	     :sort-by :mod-date
	     :category-index t)
	    ("index"
	     :show-meta nil
	     :show-comment nil
	     :uri-generator op/generate-uri
	     :uri-template "/"
	     :sort-by :date
	     :category-index nil)
	    ("about"
	     :show-meta nil
	     :show-comment nil
	     :uri-generator op/generate-uri
	     :uri-template "/about/"
	     :sort-by :date
	     :category-index nil)))))

(provide 'org-init)
;; End of the File

