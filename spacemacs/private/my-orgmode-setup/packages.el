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
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))))

(defun my-orgmode-setup/init-org-habit ()
  (use-package org-habit :defer t))

(defun my-orgmode-setup/init-remember ()
  (use-package remember :defer t))

;;; packages.el ends here
