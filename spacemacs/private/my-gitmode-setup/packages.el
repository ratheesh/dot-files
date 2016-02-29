;;; packages.el --- my-gitmode-setup layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh S <ratheeshreddy@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst my-gitmode-setup-packages
  '(
    stgit
    magit-stgit
    )
  "The list of Lisp packages required by the my-gitmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-gitmode-setup/init-stgit ()
  (use-package stgit
    :ensure t
    :config
    (progn ;; It does not work if we can put under :mode category
      (add-to-list 'auto-mode-alist ' ("\\.stgit-edit.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgit-new.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgit-squash.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgitmsg.txt$"  . git-commit-mode))
      )))

(defun my-gitmode-setup/init-magit-stgit ()
  (use-package magit-stgit
    :ensure t
    :config
    (progn
      (add-hook 'magit-mode-hook 'magit-stgit-mode))))

;;; packages.el ends here
