;;; packages.el --- my-orgmode-setup layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh S <ratheeshreddy@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

(defconst my-orgmode-setup-packages
  '(
    org
    org-page
    ;; org-habit
    ;; remember
    )
  "The list of Lisp packages required by the my-orgmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-orgmode-setup/post-init-org ()
  (progn
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
     org-ellipsis "⚡⚡⚡"
     org-todo-keywords
     '((type "TODO(t)" "STARTED(s)" "DELAYED(q@/!)" "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "DEFERRED(e@/!)" "DONE(d@/!)")))
    (add-hook 'org-mode-hook 'turn-on-auto-fill)
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    ;; Org
    (add-hook 'org-mode-hook
              (lambda ()
                (setq fill-column 79)
                (auto-fill-mode t)))
    ))

(defun my-orgmode-setup/init-org-habit ()
  (use-package org-habit :defer t))

(defun my-orgmode-setup/init-remember ()
  (use-package remember :defer t))

(defun my-orgmode-setup/init-org-page ()
;;; Org-page setup
(use-package org-page
  :ensure t
  :demand t
  :init
  (progn
    (setq op/repository-directory "/home/ratheesh/ppcport/git/ratheesh.github.io/")
    (setq
     op/site-domain "http://ratheesh.github.io/"
     op/site-main-title "Ratheesh's Tech Ramblings!"
     op/site-sub-title "==============>"
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
      ("Kannada"
       :show-meta t
       :show-comment nil
       :uri-generator op/generate-uri
       :uri-template "/kannada/%t/"
       :sort-by :mod-date
       :category-index t)
      ("Telugu"
       :show-meta t
       :show-comment nil
       :uri-generator op/generate-uri
       :uri-template "/telugu/%t/"
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

)

;;; packages.el ends here
