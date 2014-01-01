;; Org Mode setup
(provide 'package)

;; Required elisp packages
(require 'org-install)
(require 'org-bullets)
(require 'org-habit)
(require 'remember)
;(require 'remember-autoloads)

;; default file encoding settings
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Enable org mode for the files with .org extension
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

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
 org-clock-persist 'history
 org-agenda-include-diary t
 org-todo-keywords
 '((type "TODO(t)" "STARTED(s)" "DELAYED(q@/!)" "|" "CANCELLED(c@/!)" "DEFERRED(e@/!)" "DONE(d@/!)"))
)

;; Org mode keyword face customization
;; consider putting these in the theme file TODO!
(setq org-todo-keyword-faces
     '(("TODO" . "color-184")
       ("STARTED" . "color-161")
       ("DELAYED" . "color-94")
       ("CANCELED" . (:foreground "color-144" :weight bold))
       ("DEFERRED" . (:foreground "color-154" :weight bold))
       ("DONE" . (:foreground "green" :weight bold))
))
(org-clock-persistence-insinuate)

;; Org mode hooks
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'turn-on-orgtbl)
(add-hook 'org-mode-hook 'turn-on-font-lock)

;;; fix for yasnippet and autoconfig
;;; from http://iany.me/2012/03/fix-tab-binding-for-yasnippet-and-auto-complete/
(defun yas-ac-tab-noconflict ()
  (let ((command (key-binding [tab]))) ; remember command
    (local-unset-key [tab]) ; unset from (kbd "<tab>")
    (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
(add-hook 'org-mode-hook 'yas-ac-tab-noconflict)

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

(provide 'org-init)
;; End of the File

